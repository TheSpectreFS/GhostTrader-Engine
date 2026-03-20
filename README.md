<p align="center">
  <img src="https://pbs.twimg.com/profile_images/2034323146757783552/iqHI2pwH_400x400.jpg" width="80" alt="pumt" />
</p>

<h1 align="center">pumt</h1>

<p align="center">
  <strong>The open protocol for tokenized AI agents on Solana.</strong><br/>
  Build, launch, and monetize autonomous agents with on-chain utility.
</p>

<p align="center">
  <a href="https://github.com/PumtFun/pumt/actions"><img src="https://img.shields.io/github/actions/workflow/status/PumtFun/pumt/ci.yml?style=flat-square&label=ci" alt="CI" /></a>
  <a href="https://www.npmjs.com/package/@pumt/sdk"><img src="https://img.shields.io/npm/v/@pumt/sdk?style=flat-square&color=34d399" alt="npm" /></a>
  <a href="https://github.com/PumtFun/pumt/blob/main/LICENSE"><img src="https://img.shields.io/github/license/PumtFun/pumt?style=flat-square" alt="License" /></a>
  <a href="https://discord.gg/pumt"><img src="https://img.shields.io/badge/discord-join-5865f2?style=flat-square" alt="Discord" /></a>
</p>

---

## What is pumt?

pumt is an open protocol that turns AI agents into tokenized microservices on Solana. Every agent gets its own SPL token at launch — users pay for runs with that token, and a configurable percentage of revenue is automatically used to buy back and burn the supply, creating a deflationary flywheel that ties an agent's value directly to its utility.

```
┌─────────────┐     ┌──────────────┐     ┌─────────────┐     ┌──────────────┐
│  Identity    │────▶│  Skill       │────▶│  Payment    │────▶│  Token       │
│  name, bio   │     │  SKILL.md    │     │  SOL/USDC   │     │  SPL mint    │
│  avatar      │     │  instructions│     │  buyback %  │     │  auto-burn   │
└─────────────┘     └──────────────┘     └─────────────┘     └──────────────┘
        │                   │                    │                    │
        ▼                   ▼                    ▼                    ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│                          Knowledge Base                                      │
│   Structured context the agent can reference at runtime (text, URLs, files)  │
└──────────────────────────────────────────────────────────────────────────────┘
        │
        ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│                        pumt Runtime                                          │
│   Invoice creation → Payment verification → Agent execution → Buyback/Burn   │
└──────────────────────────────────────────────────────────────────────────────┘
```

## Key Features

| Feature | Description |
|---------|-------------|
| **Visual Agent Builder** | Drag-and-drop node editor for composing agents — no code required |
| **SKILL.md System** | Declarative skill definitions using a simple markdown format that any LLM can follow |
| **Knowledge Base** | Attach structured context (text, URLs, files) that the agent references at runtime |
| **On-Chain Payments** | SOL or USDC invoice system built on the pump.fun Agent Payments SDK |
| **Buyback & Burn** | Configurable % of revenue automatically buys back and burns the agent's token |
| **One-Click Deploy** | Launch agent + token simultaneously — hosted infrastructure included |
| **Self-Hosting** | Run the full stack on your own infrastructure with Docker or Kubernetes |
| **CLI Tooling** | Create, configure, deploy, and monitor agents from the terminal |
| **TypeScript SDK** | Programmatic access to the entire pumt protocol |

## Quick Start

### Install the CLI

```bash
npm install -g @pumt/cli
```

### Create an agent

```bash
pumt init my-agent
cd my-agent
```

This scaffolds:

```
my-agent/
├── SKILL.md           # Agent instructions
├── knowledge/         # Knowledge base entries
│   └── default.json
├── pumt.config.ts     # Agent + token + payment config
└── .env.example       # Environment variables
```

### Configure

Edit `pumt.config.ts`:

```typescript
import { defineConfig } from "@pumt/sdk";

export default defineConfig({
  identity: {
    name: "Research Agent",
    description: "Deep-dives into any Solana token and returns a structured report",
  },
  token: {
    name: "ResearchToken",
    symbol: "RSRCH",
    description: "Utility token for the Research Agent",
  },
  skill: {
    name: "Token Research",
    category: "Research",
    tags: ["solana", "defi", "analysis"],
  },
  payment: {
    currency: "USDC",
    pricePerRun: 1.0,
    buybackPercent: 50,
    environment: "mainnet",
  },
});
```

### Deploy

```bash
pumt deploy
```

The CLI will:
1. Validate your SKILL.md and config
2. Create the SPL token on Solana
3. Upload skill + knowledge to pumt runtime
4. Return a live URL and token mint address

### Invoke the agent

```bash
pumt run my-agent --prompt "Analyze the JUP token"
```

Or via the SDK:

```typescript
import { PumtClient } from "@pumt/sdk";

const pumt = new PumtClient({ rpcUrl: "https://api.mainnet-beta.solana.com" });

const invoice = await pumt.createInvoice("my-agent", {
  prompt: "Analyze the JUP token",
});

// Pay the invoice on-chain, then:
const result = await pumt.awaitResult(invoice.id);
console.log(result.output);
```

## Architecture

```
                                    ┌─────────────────────┐
                                    │   pumt Dashboard    │
                                    │   (React + Vite)    │
                                    └─────────┬───────────┘
                                              │
                                              ▼
┌──────────┐   ┌──────────────┐   ┌───────────────────────┐   ┌──────────────┐
│  @pumt/  │──▶│   pumt API   │──▶│    Agent Runtime      │──▶│   Solana     │
│  cli     │   │  (Express)   │   │  (Skill + Knowledge)  │   │  (on-chain)  │
│          │   │              │   │                       │   │              │
│  @pumt/  │──▶│  /agents     │   │  Invoice creation     │   │  SPL Token   │
│  sdk     │   │  /invoices   │   │  Payment verification │   │  PDA lookup  │
│          │   │  /payments   │   │  LLM execution        │   │  Buyback     │
│          │   │  /runs       │   │  Result delivery      │   │  Burn        │
└──────────┘   └──────────────┘   └───────────────────────┘   └──────────────┘
```

### Core Components

| Component | Package | Description |
|-----------|---------|-------------|
| **Core** | `@pumt/core` | Shared types, validation, SKILL.md parser, config schema |
| **SDK** | `@pumt/sdk` | TypeScript client for interacting with pumt agents programmatically |
| **CLI** | `@pumt/cli` | Command-line tool for agent lifecycle management |
| **Runtime** | `@pumt/runtime` | Server-side agent execution engine |

## Documentation

| Guide | Description |
|-------|-------------|
| [Getting Started](docs/getting-started.md) | First agent in under 5 minutes |
| [Architecture](docs/architecture.md) | System design and component overview |
| [SKILL.md System](docs/skill-system.md) | How to write agent instructions |
| [Knowledge Base](docs/knowledge-base.md) | Structured context for agents |
| [Tokenization](docs/tokenization.md) | SPL token creation and lifecycle |
| [Payments](docs/payments.md) | Invoice system, on-chain verification |
| [Buyback & Burn](docs/buyback-burn.md) | Deflationary mechanics configuration |
| [Hosting & Deployment](docs/hosting.md) | Self-hosting, Docker, Kubernetes |
| [Security Model](docs/security.md) | Threat model and mitigations |
| [API Reference](docs/api-reference.md) | Full REST API specification |
| [SDK Reference](docs/sdk-reference.md) | TypeScript SDK documentation |
| [CLI Reference](docs/cli-reference.md) | All CLI commands and flags |

## How the Economics Work

```
User pays 1 USDC to invoke agent
         │
         ▼
┌─────────────────────────────────┐
│  Revenue Split (configurable)   │
│                                 │
│  ┌───────────┐  ┌────────────┐  │
│  │  50%      │  │   50%      │  │
│  │  Creator  │  │   Buyback  │  │
│  │  Revenue  │  │   & Burn   │  │
│  └───────────┘  └─────┬──────┘  │
└─────────────────────────────────┘
                        │
                        ▼
              ┌──────────────────┐
              │  Automated       │
              │  Market Buy      │
              │  of Agent Token  │
              └────────┬─────────┘
                       │
                       ▼
              ┌──────────────────┐
              │  Tokens Burned   │
              │  (removed from   │
              │   circulation)   │
              └──────────────────┘
                       │
                       ▼
              Supply decreases → Scarcity increases → Value accrues
```

The buyback percentage is configurable from 0% to 100% in 5% increments. Higher buyback means more aggressive deflation. The mechanism runs automatically on an hourly cycle via the pumt runtime.

## Examples

- [Basic Agent](examples/basic-agent/) — minimal agent with a single skill
- [Skill Templates](examples/skill-templates/) — pre-built SKILL.md files for common use cases
- [Knowledge Base](examples/knowledge-base/) — structured context examples
- [Docker Deployment](examples/deployment/docker/) — self-host with Docker Compose
- [Kubernetes](examples/deployment/kubernetes/) — production deployment on k8s

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

[MIT](LICENSE) — pumt is open source and free to use.
