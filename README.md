```markdown
<p align="center">
  <img src="https://img.shields.io/badge/Solana-Simulation-14F195?style=for-the-badge&logo=solana&logoColor=black" alt="Solana" />
  <img src="https://img.shields.io/badge/Protocol-Paper_Trading-blue?style=for-the-badge" alt="Protocol" />
</p>

<h1 align="center">GhostTrader Engine (POC)</h1>

<p align="center">
  <strong>High-fidelity paper trading simulator for the Solana Memecoin ecosystem.</strong><br/>
  Test strategies, analyze real-time volatility, and master the market without financial risk.
</p>

<p align="center">
  <a href="#"><img src="https://img.shields.io/badge/version-1.0.0-blue?style=flat-square" alt="Version" /></a>
  <a href="#"><img src="https://img.shields.io/badge/python-3.13-34d399?style=flat-square&logo=python" alt="Python" /></a>
  <a href="#"><img src="https://img.shields.io/badge/UI-Streamlit-FF4B4B?style=flat-square&logo=streamlit" alt="Streamlit" /></a>
</p>

> [!WARNING]  
> **Legacy Status:** This Proof of Concept (POC) is currently not under active maintenance.

---

## Operational Workflow

GhostTrader Engine acts as a localized execution layer that mirrors the Solana Mainnet using real-time data streams.

```text
┌─────────────┐      ┌──────────────┐      ┌─────────────┐      ┌──────────────┐
│  Market     │ ───▶ │  BitQuery    │ ───▶ │ GhostTrader │ ───▶ │ Portfolio    │
│  Data (SOL) │      │  API Stream  │      │ Core Logic  │      │ Dashboard    │
└─────────────┘      └──────────────┘      └──────┬──────┘      └──────────────┘
                                                  │
                                                  ▼
                                       ┌──────────────────────┐
                                       │  Virtual Execution   │
                                       │  - P/L Calculation   │
                                       │  - Fee Simulation    │
                                       └──────────────────────┘
```

## Core Features

| Feature | Description |
|---------|-------------|
| **Real-Time Tracking** | Live price monitoring for any SPL Token via BitQuery integration. |
| **Simulated Execution** | Execute Buy/Sell orders with customizable trading fees and slippage. |
| **Portfolio Analytics** | Advanced P/L tracking with historical performance visualization. |
| **Data Persistence** | Local database management using DuckDB for ultra-fast query speeds. |
| **Exportable History** | Full audit logs of your trades, exportable to CSV for external analysis. |

## Quick Setup

### 🔑 API Authentication
To fetch real-time data, you need a **BitQuery Access Token**:
1. Sign up at [BitQuery](https://account.bitquery.io/).
2. Create a 'New Application' in your dashboard.
3. Generate an **Access Token** and paste it into the app's settings page.

### 🚀 Deployment Options

#### Option 1: Docker (Simple)
```bash
docker pull paperpaws/paper-paws-poc:1.0.0
docker run --name ghost-trader -p 8501:8501 paperpaws/paper-paws-poc:1.0.0
```

#### Option 2: Standalone Executable
1. Download the latest `.zip` release.
2. Extract and run `paperpaws.exe`.
3. *Note: Keep the exe inside a folder to allow database generation.*

## Technical Architecture

```text
                          ┌──────────────────────────┐
                          │     Streamlit Frontend   │
                          └─────────────┬────────────┘
                                        │
                 ┌──────────────────────┴──────────────────────┐
                 ▼                                             ▼
       ┌──────────────────┐                         ┌──────────────────┐
       │   Logic Engine   │                         │  Storage Layer   │
       │ - Price Fetcher  │ ────── JSON/YAML ─────▶ │ - DuckDB         │
       │ - Trade Signer   │                         │ - CSV Exports    │
       └──────────────────┘                         └──────────────────┘
```

## Dependencies
* **Core:** Python 3.13+, Pandas, PyYAML.
* **Database:** DuckDB.
* **UI:** Streamlit, Streamlit Extras.
* **Build:** PyInstaller.

---

### License
Modified MIT License with Repository and Commercial Restrictions.

*Developed by **TheSpectreFS***
```
