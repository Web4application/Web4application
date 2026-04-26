import { getKernelVersion } from "../chain/provider.js";
import { fetchIPFS } from "../ipfs/client.js";

export function syncDaemon() {
  setInterval(async () => {
    const latest = await getKernelVersion();
    const manifest = await fetchIPFS(latest);

    console.log("🔄 Sync check:", latest);
  }, 30000);
}
