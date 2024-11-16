---
title: Swap
description: A detailed guide to the Swap API in the MyTonSwap SDK, which facilitates creating token swap requests on the TON blockchain.
sidebar_position: 3
keywords:
    - MyTonSwap SDK
    - Swap API
    - Token Swap
    - Best Route
    - TON Blockchain
    - JavaScript SDK
    - Swap Response
---

### Swap API Documentation

The **Swap API** in the MyTonSwap SDK enables the creation of swap requests between assets, leveraging the best route determined by the Router API. This allows users to execute token swaps seamlessly on the TON blockchain.

---

## `createSwap`

Creates a swap request using the provided user wallet address and the best route returned by the Router API.

### Parameters

-   **userWalletAddress** (`string`): The address of the user's wallet from which the tokens will be swapped.
-   **bestRoute** (`BestRoute`): The best route for the swap, as determined by the Router API. This contains information about the path, fees, and estimated output for the swap.
-   **app_id** (`string`, optional): An optional application ID that can be included in the request headers for identifying the application making the request. If not provided, the header is omitted.

### Returns

-   `Promise<SwapResponse>`: A promise that resolves to a swap response, which includes information about the swap transaction, such as the transaction payload and address

### Example

```typescript
import { MyTonSwapClient } from "@mytonswap/sdk";

const client = new MyTonSwapClient();

async function performSwap() {
    const userWallet = "your-wallet-address";

    // Fetch best route from the Router API
    const bestRoute = await client.router.findBestRoute(
        "input-asset-address",
        "output-asset-address",
        1000000000n, // 1 token
        1 // 1% slippage
    );

    // Create the swap using the best route
    const swapResponse = await client.swap.createSwap(userWallet, bestRoute);
    console.log("Swap Response:", swapResponse);
}

performSwap();
```

### Error Handling

The method may throw an error if:

-   The provided wallet address is invalid.
-   The best route cannot be fetched from the Router API.
-   The swap fails due to network issues, insufficient liquidity, or invalid inputs.

### Example with Error Handling

```typescript
try {
    const bestRoute = await client.router.findBestRoute(
        "input-asset-address",
        "output-asset-address",
        1000000000n,
        1 // slippage
    );
    const swapResponse = await client.swap.createSwap(
        "user-wallet-address",
        bestRoute
    );
    console.log("Swap successfully created:", swapResponse);
} catch (error) {
    console.error("Error creating swap:", error.message);
}
```

---

### Notes

-   The `createSwap` method can be used to initiate a token swap transaction once the best route is found.
-   It's recommended to validate the wallet address and best route before calling this method.
-   The `app_id` is optional but can be useful for tracking or identifying requests made by different applications.

---
