import { syncDaemon } from "../sync/sync-daemon.js";
import { registerSW } from "./service-worker.js";
import { getKernelVersion } from "../chain/provider.js";
import { fetchIPFS } from "../ipfs/client.js";

export async function boot() {
  console.log("🧠 Booting Web4 OS...");

  await registerSW();

  const version = await getKernelVersion();
  const manifest = await fetchIPFS(version);

  console.log("📦 Loaded manifest:", version);

  syncDaemon();

  console.log("🚀 Web4 OS Ready");
}

boot();
