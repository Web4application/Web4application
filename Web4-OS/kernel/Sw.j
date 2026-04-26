export async function registerSW() {
  if ("serviceWorker" in navigator) {
    await navigator.serviceWorker.register("/sw.js");
    console.log("⚙️ SW registered");
  }
}
