import fs from "fs";
import crypto from "crypto";

function hash(file) {
  return crypto.createHash("sha256")
    .update(fs.readFileSync(file))
    .digest("hex");
}

const files = fs.readdirSync("./public");

const manifest = {
  version: Date.now().toString(),
  assets: files.map(f => ({
    path: "/" + f,
    sha256: hash(`public/${f}`)
  }))
};

fs.writeFileSync("./public/manifest.json", JSON.stringify(manifest, null, 2));

console.log("📦 Manifest built");
