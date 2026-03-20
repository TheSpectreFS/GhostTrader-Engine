# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-03-20

### Added
- Buyback & burn configuration — agents can now specify a percentage (0–100%) of revenue that is automatically used to buy back and burn their SPL token
- Visual revenue split indicator in the agent builder
- Knowledge base interactive composer with templates, inline editing, and reordering
- `pumt config set buybackPercent <value>` CLI command

### Changed
- RPC endpoint is now managed by the platform — removed from user-facing configuration
- Payment node in the visual builder now displays buyback percentage
- Improved edge rendering in the visual builder (smoothstep connections)
- REST API for agents, invoices, payments, and runs
- TypeScript SDK (`@pumt/sdk`)
- CLI tool (`@pumt/cli`)
- Docker deployment support
