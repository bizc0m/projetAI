const http = require("http");
const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const port = Number(process.env.PORT || 8787);
const htmlFile = path.join(root, "IALens-v2.7.html");
const dataRoot = path.join(root, "data");

function send(res, status, body, type = "text/plain; charset=utf-8") {
  res.writeHead(status, {
    "content-type": type,
    "access-control-allow-origin": "*",
    "cache-control": "no-store"
  });
  res.end(body);
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
  const text = (paragraphs.length ? paragraphs.join("\n\n") : stripTags(cleaned)).slice(0, 12000);
  return text;
}

async function scrape(target) {
  const url = new URL(target);
  if (!["http:", "https:"].includes(url.protocol)) throw new Error("URL non supportee");
  const response = await fetch(url, {
    redirect: "follow",
    headers: {
      "accept": "text/html,application/xhtml+xml",
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

async function readRss(target) {
  const url = new URL(target);
  if (!["http:", "https:"].includes(url.protocol)) throw new Error("Flux non supporte");
  const response = await fetch(url, {
    redirect: "follow",
    headers: {
      "accept": "application/rss+xml,application/atom+xml,application/xml,text/xml",
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

const server = http.createServer(async (req, res) => {
  const requestUrl = new URL(req.url, `http://localhost:${port}`);
  try {
    if (requestUrl.pathname === "/" || requestUrl.pathname === "/AI_Lens_Observatory_v2.html") {
      return send(res, 200, fs.readFileSync(htmlFile, "utf8"), "text/html; charset=utf-8");
    }
    if (requestUrl.pathname.startsWith("/data/")) {
      const fileName = path.basename(requestUrl.pathname);
      const filePath = path.join(dataRoot, fileName);
      if (!filePath.startsWith(dataRoot) || !fs.existsSync(filePath)) return send(res, 404, "Not found");
      return send(res, 200, fs.readFileSync(filePath, "utf8"), "application/json; charset=utf-8");
    }
    if (requestUrl.pathname === "/api/scrape") {
      const target = requestUrl.searchParams.get("url");
      if (!target) return send(res, 400, JSON.stringify({ error: "URL manquante" }), "application/json; charset=utf-8");
      const payload = await scrape(target);
      return send(res, 200, JSON.stringify(payload), "application/json; charset=utf-8");
    }
    if (requestUrl.pathname === "/api/rss") {
      const target = requestUrl.searchParams.get("url");
      if (!target) return send(res, 400, JSON.stringify({ error: "Flux manquant" }), "application/json; charset=utf-8");
      const payload = await readRss(target);
      return send(res, 200, JSON.stringify(payload), "application/json; charset=utf-8");
    }
    return send(res, 404, "Not found");
  } catch (error) {
    return send(res, 502, JSON.stringify({ error: error.message }), "application/json; charset=utf-8");
  }
});

server.listen(port, () => {
  console.log(`AI Lens Observatory: http://localhost:${port}`);
});
