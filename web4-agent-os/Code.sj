web4-agent-os/
│
├── contracts/              # Blockchain layer (DID + permissions)
│   └── DIDRegistry.sol
│
├── services/
│   ├── did-service/        # Node.js DID + API layer
│   ├── agent-runtime/     # AI agent orchestrator
│   ├── blockchain-gateway/# permission checker
│
├── executor/
│   └── rust-executor/     # Secure RBAC + Kubernetes bridge
│
├── k8s/
│   ├── clusterrole.yaml
│   ├── binding.yaml
│   ├── deployment.yaml
│
├── agents/
│   └── dev-agent.json
│
├── shared/
│   └── types/
│
├── docker/
│   ├── node.Dockerfile
│   ├── rust.Dockerfile
│
└── docker-compose.yml
