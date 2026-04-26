const memory = new Map();

export function memoryGet(req) {
  return memory.get(req.url);
}

export function memorySet(req, res) {
  memory.set(req.url, res.clone());
}
