---
title: TonApi
description: A detailed guide to the TonApi class in the MyTonSwap SDK, which provides functionalities for interacting with the TON blockchain via the TON API.
sidebar_position: 4
keywords:
    - TonApi
    - TON blockchain
    - Jetton Data
    - Wallet Assets
    - Transaction Event
    - Custom Payload
    - Jetton Rates
    - SDK
    - JavaScript SDK
---

## TonApi Class

The `TonApi` class provides a set of methods for interacting with the TON blockchain via the TON API. It enables users to fetch wallet asset balances, jetton data, asset rates, and transaction events. Additionally, it provides functionality to monitor the status of a transaction until completion.

### Methods

#### `getJettonData`

Fetches the jetton data for a given wallet address and jetton address.

-   **Parameters**:
    -   `walletAddr` (string): The wallet address to fetch the jetton data for.
    -   `jettonAddress` (string): The jetton address to fetch the data from.
-   **Returns**: A `Promise<Balance>` that resolves to the balance data of the specified jetton.

#### `getCustomPayload`

Retrieves a custom payload for a specific wallet and jetton address.

-   **Parameters**:
    -   `walletAddr` (string): The address of the wallet.
    -   `jettonAddress` (string): The address of the jetton.
-   **Returns**: A `Promise<CustomPayload>` that resolves to the custom payload for the jetton.

#### `getWalletAssets`

Retrieves wallet assets for a given wallet address, including balances and rates for jettons.

-   **Parameters**:

    -   `walletAddress` (string): The address of the wallet to retrieve assets for.
    -   `currencies` (string[]): An array of currency codes to retrieve rates for (default: `['usd']`).
    -   `custom_payload` (boolean): Whether to include custom payload in the request (default: `true`).

-   **Returns**: A `Promise<Map<string, Balance>>` that resolves to a map of balances, keyed by jetton addresses.

#### `getAssetsRates`

Fetches the rates of specified assets from the TON API.

-   **Parameters**:
    -   `assetsAddresses` (string[]): An array of asset addresses to fetch rates for.
-   **Returns**: A `Promise<Map<string, Prices>>` that resolves to a map where the keys are user-friendly asset addresses and the values are their corresponding prices.

#### `waitForTransactionResult`

Waits for a transaction result by periodically checking the transaction status.

-   **Parameters**:
    -   `hash` (string): The hash of the transaction to wait for.
    -   `period_ms` (number): The period in milliseconds to wait between checks (default: `3000`).
    -   `maxRetry` (number): The maximum number of retries before giving up (default: `30`).
-   **Returns**: A `Promise<TransactionEvent>` that resolves with the transaction result when complete.
-   **Throws**: An error if the maximum number of retries is reached.

#### `getTransactionEvent`

Fetches a transaction event from the TON API using the provided hash.

-   **Parameters**:
    -   `hash` (string): The hash of the transaction event to retrieve.
-   **Returns**: A `Promise<TransactionEvent>` that resolves to the transaction event.

#### `allTransactionComplete`

Checks if all transactions in the given event are complete.

-   **Parameters**:
    -   `event` (TransactionEvent): The transaction event to check.
-   **Returns**: `true` if all transactions are complete and successful, otherwise `false`.
-   **Throws**: An error if any transaction action has a status other than 'ok'.

### Usage

```javascript
const tonApi = new TonApi();

// Example: Get jetton data
const jettonData = await tonApi.getJettonData("walletAddress", "jettonAddress");

// Example: Get wallet assets
const walletAssets = await tonApi.getWalletAssets("walletAddress");

// Example: Get transaction event
const transactionEvent = await tonApi.getTransactionEvent("transactionHash");
```

### Conclusion

The `TonApi` class provides a robust set of functions for working with the TON blockchain, including handling jetton data, retrieving wallet balances, fetching asset rates, and monitoring transactions. It is an essential component for developers building on the TON ecosystem using the MyTonSwap SDK.
