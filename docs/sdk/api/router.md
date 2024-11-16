---
title: Router
description: A comprehensive guide to the Router API in the MyTonSwap SDK, which helps you find the best swap routes for assets on the TON blockchain.
sidebar_position: 2
keywords:
    - MyTonSwap SDK
    - Router API
    - Best Route
    - Token Swap
    - TON Blockchain
    - DEX
    - JavaScript SDK
---

### Router API Documentation

The **Router API** in the MyTonSwap SDK provides functionality for finding the optimal swap route between two assets on the TON blockchain. This ensures users get the best rates and lowest slippage for their token swaps.

---

## `findBestRoute`

Finds the best route for a given input and output asset, considering the specified amount, slippage, and optional DEX.

### Parameters

-   **inputAssetAddress** (`string`): The address of the input asset you want to swap from.
-   **outputAssetAddress** (`string`): The address of the output asset you want to swap to.
-   **payAmount** (`bigint`): The amount of the input asset to pay.
-   **slippage** (`number`, optional): The maximum allowed slippage percentage. If not specified, it defaults to `auto`.
-   **forceDex** (`Dex`, optional): The DEX to force the route through. If not specified, the SDK chooses the best available DEX.

### Returns

-   `Promise<BestRoute>`: A promise that resolves to the best route, including information about the path, estimated returns, and fees.

### Example

```typescript
import { MyTonSwapClient, toNano } from "@mytonswap/sdk";

const client = new MyTonSwapClient();

async function findRoute() {
    const inputAsset = "EQC5...TON-ADDRESS";
    const outputAsset = "EQD9...NOT-ADDRESS";
    const payAmount = toNano(1); // Pay 1 TON

    try {
        const bestRoute = await client.router.findBestRoute(
            inputAsset,
            outputAsset,
            payAmount,
            1 // 1% slippage
        );
        console.log("Best Route:", bestRoute);
    } catch (error) {
        console.error("Error finding best route:", error);
    }
}

findRoute();
```

### Error Handling

The method can throw an error if:

-   The input or output asset address is invalid.
-   The request fails due to network issues.
-   Insufficient liquidity for the requested swap.

### Example with Error Handling

```typescript
try {
    const bestRoute = await client.router.findBestRoute(
        inputAsset,
        outputAsset,
        payAmount,
        1.5, // 1.5% slippage
        "stonfi" // Force the route through Ston.fi
    );
    console.log("Route found:", bestRoute);
} catch (error) {
    console.error("Failed to find best route:", error.message);
}
```

---

### Notes

-   It's recommended to validate asset addresses and slippage before calling this method.
-   If the user does not provide an asset address, you can fetch it using the Assets API (`getExactAsset`).
-   Forcing a specific DEX (`forceDex`) is optional but can be used if you prefer a specific liquidity provider.
