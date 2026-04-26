export async function getKernelVersion() {
  const res = await fetch("https://127.0.0.1/chain/manifest");
  return res.text();
}
