# Contributing to pumt

Thank you for your interest in contributing to pumt. This document provides guidelines and information for contributors.

## Development Setup

### Prerequisites

- Node.js 20+
- npm 10+
- Solana CLI (optional, for on-chain testing)

### Clone and install

```bash
git clone https://github.com/TheSpectreFS/GhostTrader-Engine.git
cd pumt
npm install
```

### Build all packages

```bash
npm run build
```

### Run tests

```bash
npm test
```

### Run the dev server

```bash
npm run dev
```

## Project Structure

```
pumt/
├── packages/
│   ├── core/          # Shared types, validation, parsers
│   ├── sdk/           # TypeScript SDK for interacting with agents
│   └── cli/           # Command-line interface
├── docs/              # Documentation
├── examples/          # Example agents and configs
└── .github/           # CI/CD workflows and templates
```

## Code Style

- TypeScript strict mode everywhere
- No `any` types — use `unknown` and narrow
- Prefer `const` over `let`
- Use named exports
- Write JSDoc for public APIs
- Keep functions small and focused

## Commit Convention

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: add buyback percentage slider
fix: correct invoice PDA derivation
docs: update hosting guide
chore: upgrade dependencies
```

## Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/my-feature`)
3. Make your changes
4. Add tests if applicable
5. Ensure all tests pass
6. Submit a pull request

### PR Checklist

- [ ] Tests pass locally
- [ ] TypeScript compiles without errors
- [ ] Documentation updated (if applicable)
- [ ] Commit messages follow convention
- [ ] No secrets or API keys committed

## Reporting Issues

Use [GitHub Issues](https://github.com/TheSpectreFS/GhostTrade-Engine/issues) for bug reports and feature requests. Please include:

- Clear description of the issue
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Environment details (OS, Node version, etc.)

## Security

If you discover a security vulnerability, please do **not** open a public issue. Instead, email security@pumt.fun with details.

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](LICENSE).
