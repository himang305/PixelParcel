# 🌍 PixelParcel

Welcome to **PixelParcel**, the Web3-powered land claiming platform where the world is divided into pixelated parcels. Users can **claim**, **release**, and **swap** land tiles — all stored securely on-chain.

![Screenshot](https://raw.githubusercontent.com/himang305/PixelParcel/refs/heads/main/shot.png)

🔗 **Try it live:** [PixelParcel Demo](https://himang305.github.io/PixelParcel/)

---

## 🚀 Overview

**PixelParcel** lets users:
- 🧭 Claim a land parcel based on their current geolocation
- 🔐 Store ownership of the land on a Web3 smart contract
- 🔁 Swap land tiles with other users
- ❌ Release land ownership
- 🌐 View all claimed land on an interactive map

Each location is mapped to **2-decimal precision**, creating a grid system that divides the world into 0.01° x 0.01° blocks.

---

## ✨ Features

- 📍 **Web3 Land Claiming**: Claim ownership of real-world locations via your crypto wallet.
- 🗺️ **Interactive Map**: View owned parcels with custom map markers.
- 💬 **what3words Integration**: Display locations using three-word addresses.
- 🔄 **Ownership Swapping**: Exchange plots with other users.
- 🧹 **Land Releasing**: Free up your claimed location any time.
- 🛡️ **Smart Contract Backed**: All claims are verified and stored on-chain.

---

## 🔗 Blockchain Info

- **Chain**: WEMIX Testnet
- **Smart Contract Address**: `0x89dE61BFC5023d99f334B9659381267Be6dfb88B`
- **Wallet Requirement**: Please use **MetaMask Desktop** for proper functionality.

---

## 🔧 Tech Stack

- **Frontend**: JavaScript, Leaflet.js (Map), what3words API
- **Smart Contract**: Solidity
- **Blockchain**: Ethereum-compatible network (WEMIX Testnet)
- **Wallet Support**: MetaMask (via Web3.js)

---

## 📦 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/pixelparcel.git
cd pixelparcel
http-server
Install Metamask
Add Wemix Testnet network using chainlist.org
Get wemix from faucet: https://wallet.test.wemix.com/faucet
Give location permission on website
