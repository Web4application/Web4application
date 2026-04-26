export async function aiPolicy(req) {
  const url = req.url;

  if (url.includes("/api")) return "NETWORK_FIRST";
  if (url.match(/\.(png|jpg|css)$/)) return "CACHE_FIRST";
  if (url.includes("/chat")) return "MEMORY_FIRST";

  return "CACHE_FIRST";
}
