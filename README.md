## Operational Workflow

Follow me here on my personal Twitter (X): https://x.com/Lix_Devv

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/7ce12542-62f3-4d84-9f28-e107708c739a" />


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
docker pull ghosttrader/GhostTrade-Engine:0.1.0
docker run --name ghost-trader -p 8501:8501 GhostTrade-Engine:0.1.0
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

*Developed by **LixerDev***
```
