import express from "express";
import axios from "axios";

const app = express();
app.use(express.json());

async function checkPermission(intent: any) {
  const res = await axios.post("http://blockchain-gateway:4000/check", intent);
  return res.data.allowed;
}

async function execute(intent: any) {
  const res = await axios.post("http://rust-executor:8080/execute", intent);
  return res.data;
}

app.post("/agent/run", async (req, res) => {

  const intent = {
    did: req.body.did,
    action: "create_deployment",
    resource: "api-service-v2"
  };

  const allowed = await checkPermission(intent);

  if (!allowed) {
    return res.status(403).json({ status: "denied" });
  }

  const result = await execute(intent);

  res.json({
    status: "success",
    result
  });
});

app.listen(3000);
