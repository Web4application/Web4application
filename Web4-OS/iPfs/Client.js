export async function fetchIPFS(cid) {
  const url = `https://ipfs.io/ipfs/${cid}`;
  const res = await fetch(url);
  return res.json();
}
