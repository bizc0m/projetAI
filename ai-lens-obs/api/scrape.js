function send(res, status, body, type = "application/json; charset=utf-8") {
  res.statusCode = status;
  res.setHeader("content-type", type);
  res.setHeader("access-control-allow-origin", "*");
  res.setHeader("cache-control", "s-maxage=120, stale-while-revalidate=600");
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

function meta(html, selector) {
  const escaped = selector.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
  const re = new RegExp(`<meta[^>]+(?:property|name)=["']${escaped}["'][^>]+content=["']([^"']+)["'][^>]*>`, "i");
  return decodeHtml(html.match(re)?.[1] || "").trim();
}

function extractArticle(html) {
  const cleaned = html
    .replace(/<script[\s\S]*?<\/script>/gi, " ")
    .replace(/<style[\s\S]*?<\/style>/gi, " ")
    .replace(/<noscript[\s\S]*?<\/noscript>/gi, " ");
  const paragraphs = [...cleaned.matchAll(/<p\b[^>]*>([\s\S]*?)<\/p>/gi)]
    .map(match => stripTags(match[1]))
    .filter(text => text.length > 45);
  return (paragraphs.length ? paragraphs.join("\n\n") : stripTags(cleaned)).slice(0, 12000);
}

async function scrape(target) {
  const url = new URL(target);
  if (!["http:", "https:"].includes(url.protocol)) throw new Error("URL non supportee");
  const response = await fetch(url, {
    redirect: "follow",
    headers: {
      accept: "text/html,application/xhtml+xml",
      "user-agent": "AI-Lens-Observatory-LocalScraper/1.0"
    }
  });
  if (!response.ok) throw new Error(`HTTP ${response.status}`);
  const html = await response.text();
  const title = meta(html, "og:title") || stripTags(html.match(/<title[^>]*>([\s\S]*?)<\/title>/i)?.[1] || "") || url.hostname;
  const description = meta(html, "og:description") || meta(html, "description");
  const text = extractArticle(html);
  return {
    url: response.url,
    source: url.hostname.replace(/^www\./, ""),
    title,
    description,
    text: text || description || title,
    scrapedAt: new Date().toISOString()
  };
}

module.exports = async function handler(req, res) {
  if (req.method === "OPTIONS") return send(res, 204, "");
  try {
    const target = req.query?.url;
    if (!target) return send(res, 400, { error: "URL manquante" });
    return send(res, 200, await scrape(target));
  } catch (error) {
    return send(res, 502, { error: error.message });
  }
};
