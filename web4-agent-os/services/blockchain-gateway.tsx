import express from "express";

const app = express();
app.use(express.json());

const permissions = new Map([
  ["did:ethr:0x8F3a", true]
]);

app.post("/check", (req, res) => {
  const allowed = permissions.get(req.body.did) || false;

  res.json({
    allowed
  });
});

app.listen(4000);
