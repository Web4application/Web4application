import { aiPolicy } from "../ai/decision-engine.js";
import { memoryGet, memorySet } from "../memory/memory.js";

export async function kernelFetch(req, cache) {
  const policy = await aiPolicy(req);

  if (policy === "MEMORY_FIRST") {
    return memoryGet(req) || fetch(req);
  }

  if (policy === "CACHE_FIRST") {
    const cached = await cache.match(req);
    if (cached) return cached;

    const res = await fetch(req);
    memorySet(req, res);
    cache.put(req, res.clone());
    return res;
  }

  if (policy === "NETWORK_FIRST") {
    return fetch(req).catch(() => cache.match(req));
  }
}
