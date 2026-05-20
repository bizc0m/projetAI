const http = require("http");
const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const port = Number(process.env.PORT || 8787);
const htmlFile = path.join(root, "AI_Lens_Observatory_v2.html");
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
    return send(res, 404, "Not found");
  } catch (error) {
    return send(res, 502, JSON.stringify({ error: error.message }), "application/json; charset=utf-8");
  }
});

server.listen(port, () => {
  console.log(`AI Lens Observatory: http://localhost:${port}`);
});
