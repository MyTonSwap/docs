---
title: Getting Started
description: Learn how to install and use the MyTonSwap SDK with a step-by-step guide and a basic example of performing a token swap on the TON blockchain.
sidebar_position: 2
keywords:
    - MyTonSwap SDK
    - Getting Started
    - Installation
    - Token Swap Example
    - JavaScript SDK
    - TON Blockchain
---

## Getting Started

This section will guide you through the setup and basic usage of the **MyTonSwap SDK**, helping you get started quickly with integrating token swaps and asset management into your project.

### Installation

To install the MyTonSwap SDK, run the following command:

```bash
npm install @mytonswap/sdk
```

If you're using **Yarn** or **pnpm**, use one of the following commands:

```bash
yarn add @mytonswap/sdk
```

```bash
pnpm add @mytonswap/sdk
```

### Usage

Here's a basic example of how to use the MyTonSwap SDK to find the best swap route and create a swap payload.

```typescript
import { MyTonSwapClient, toNano } from "@mytonswap/sdk";

const client = new MyTonSwapClient();

async function performSwap() {
    try {
        const userWallet = "your-wallet-address";

        // Retrieve the TON and NOT assets
        const TON = await client.assets.getExactAsset("TON");
        const NOT = await client.assets.getExactAsset("NOT");

        if (!TON || !NOT) {
            console.error("Failed to retrieve assets.");
            return;
        }

        // Find the best swap route from TON to NOT
        const bestRoute = await client.router.findBestRoute(
            TON.address,
            NOT.address,
            toNano(1), // Amount to swap (1 TON)
            1 // Number of routes to find
        );

        if (!bestRoute) {
            console.error("No optimal route found.");
            return;
        }

        // Create a swap payload using the best route
        const swapPayload = await client.swap.createSwap(userWallet, bestRoute);

        console.log("Swap Payload:", swapPayload);
    } catch (error) {
        console.error("Error performing swap:", error);
    }
}

// Execute the function
performSwap();
```

### Explanation

1. **MyTonSwapClient**: The main client for interacting with the MyTonSwap SDK. It provides access to assets, routing, and swap functions.
2. **toNano**: A utility function to convert values to the smallest unit of Ton (nanoTon).
3. **getExactAsset**: Fetches a specific asset by its name or identifier.
4. **findBestRoute**: Finds the optimal route for a token swap, minimizing fees and maximizing returns.
5. **createSwap**: Generates a swap payload ready to be used for executing the swap.

### Additional Notes

-   Make sure your wallet is connected and authorized using TonConnect for the swap to be executed successfully.
-   The `performSwap` function is an async function; make sure to handle it with proper error handling as shown in the example.

This example covers the basics of using the SDK. For more detailed usage and advanced configurations, refer to the **API Reference** section.
