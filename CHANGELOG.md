# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2026-03-18

### Added
- Buyback & burn configuration — agents can now specify a percentage (0–100%) of revenue that is automatically used to buy back and burn their SPL token
- Visual revenue split indicator in the agent builder
- Knowledge base interactive composer with templates, inline editing, and reordering
- `pumt config set buybackPercent <value>` CLI command

### Changed
- RPC endpoint is now managed by the platform — removed from user-facing configuration
- Payment node in the visual builder now displays buyback percentage
- Improved edge rendering in the visual builder (smoothstep connections)

## [0.2.0] - 2026-03-15

### Added
- Visual drag-and-drop agent builder with React Flow
- Block types: Identity, Token, Skill, Payment, Knowledge, Output
- Config panel with slide-in forms for each block
- Interactive knowledge base with quick-add templates
- Eve-style dark theme with emerald accents

### Changed
- Replaced wizard-based agent creation with node-based visual builder
- Data model updated: agents now include `identity` and `token` as top-level fields
- Launchpad model: agent + token are created together

### Fixed
- Output node styling bug (white border artifact)
- Duplicate edge connections on node drop
- React Flow v12+ TypeScript compatibility issues

## [0.1.0] - 2026-03-12

### Added
- Initial release
- Agent creation and hosting
- SKILL.md parsing and execution
- Invoice-based payment system (SOL/USDC)
- Mock payment mode for local development
- pump.fun Agent Payments SDK integration
- Dashboard with agent metrics
- REST API for agents, invoices, payments, and runs
- TypeScript SDK (`@pumt/sdk`)
- CLI tool (`@pumt/cli`)
- Docker deployment support
