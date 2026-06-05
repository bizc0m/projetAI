function send(res, status, body, type = "application/json; charset=utf-8") {
  res.statusCode = status;
  res.setHeader("content-type", type);
  res.setHeader("access-control-allow-origin", "*");
  res.setHeader("cache-control", "s-maxage=300, stale-while-revalidate=1800");
  res.end(typeof body === "string" ? body : JSON.stringify(body));
}

function decodeHtml(value = "") {
  return value
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, "\"")
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&lt;/g, "<")
    .replace(/&gt;/g, ">");
}

function stripTags(value = "") {
  return decodeHtml(value.replace(/<[^>]*>/g, " ")).replace(/\s+/g, " ").trim();
}

function cleanXml(value = "") {
  return decodeHtml(value.replace(/<!\[CDATA\[([\s\S]*?)\]\]>/g, "$1")).trim();
}

function xmlValue(block, tag) {
  const match = block.match(new RegExp(`<${tag}\\b[^>]*>([\\s\\S]*?)<\\/${tag}>`, "i"));
  return cleanXml(match?.[1] || "");
}

function normalizeDate(value = "") {
  const time = Date.parse(value);
  return Number.isNaN(time) ? new Date().toISOString().slice(0, 10) : new Date(time).toISOString().slice(0, 10);
}

async function readRss(target) {
  const url = new URL(target);
  if (!["http:", "https:"].includes(url.protocol)) throw new Error("Flux non supporte");
  const response = await fetch(url, {
    redirect: "follow",
    headers: {
      accept: "application/rss+xml,application/atom+xml,application/xml,text/xml",
      "user-agent": "AI-Lens-Observatory-RSS/1.0"
    }
  });
  if (!response.ok) throw new Error(`HTTP ${response.status}`);
  const xml = await response.text();
  const source = stripTags(xmlValue(xml, "title")) || url.hostname.replace(/^www\./, "");
  const blocks = [...xml.matchAll(/<item\b[\s\S]*?<\/item>/gi)].map(match => match[0]);
  const atomBlocks = blocks.length ? [] : [...xml.matchAll(/<entry\b[\s\S]*?<\/entry>/gi)].map(match => match[0]);
  const items = (blocks.length ? blocks : atomBlocks).slice(0, 20).map(block => {
    const href = block.match(/<link\b[^>]*href=["']([^"']+)["'][^>]*\/?>/i)?.[1];
    const rawLink = stripTags(xmlValue(block, "link")) || cleanXml(href || "");
    return {
      title: stripTags(xmlValue(block, "title")),
      url: rawLink,
      date: normalizeDate(xmlValue(block, "pubDate") || xmlValue(block, "updated") || xmlValue(block, "published")),
      description: stripTags(xmlValue(block, "description") || xmlValue(block, "summary") || xmlValue(block, "content:encoded")).slice(0, 1000)
    };
  }).filter(item => item.title && item.url);
  return { url: response.url, source, items };
}

module.exports = async function handler(req, res) {
  if (req.method === "OPTIONS") return send(res, 204, "");
  try {
    const target = req.query?.url;
    if (!target) return send(res, 400, { error: "Flux manquant" });
    return send(res, 200, await readRss(target));
  } catch (error) {
    return send(res, 502, { error: error.message });
  }
};
