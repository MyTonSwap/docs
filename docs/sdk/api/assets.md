---
title: Assets
description: Comprehensive guide for interacting with the Assets API in the MyTonSwap SDK, including methods for fetching specific assets, paginated asset lists, and asset pairs.
sidebar_position: 1
keywords:
    - MyTonSwap SDK
    - Assets API
    - Token Fetching
    - Asset Pairs
    - TON Blockchain
    - JavaScript SDK
---

### Assets API Documentation

The **Assets API** provides various methods for interacting with assets on the TON blockchain using the MyTonSwap SDK. It allows you to fetch specific assets, retrieve a list of assets, search for assets with pagination, and get asset pairs.

---

## `getExactAsset`

Retrieves a specific asset by its token address.

### Parameters

-   **token_address** (`string`): The address of the token you want to fetch.

### Returns

-   `Promise<Asset | null>`: A promise that resolves to the asset object if found, or `null` if the asset is not found.

### Example

```typescript
const TON = await client.assets.getExactAsset("EQC5...TON-ADDRESS");
if (TON) {
    console.log("Asset Found:", TON);
} else {
    console.log("Asset not found");
}
```

---

## `getAssets`

Fetches a list of assets based on the provided array of asset addresses.

### Parameters

-   **assetsAddress** (`string[]`): An array of asset addresses to fetch.

### Returns

-   `Promise<Asset[]>`: A promise that resolves to an array of asset objects.

### Example

```typescript
const assets = await client.assets.getAssets([
    "EQC5...TON-ADDRESS",
    "EQD9...NOT-ADDRESS",
]);
console.log("Assets:", assets);
```

---

## `getPaginatedAssets`

Retrieves a paginated list of assets, with optional search and warning filters.

### Parameters

-   **page** (`number`, optional): The page number to retrieve. Defaults to `1`.
-   **warning** (`boolean`, optional): Include assets with warnings if set to `true`. Defaults to `false`.
-   **phrase** (`string`, optional): A search phrase to filter the assets.

### Returns

-   `Promise<PaginatedAssets>`: A promise that resolves to a paginated list of assets.

### Example

```typescript
const paginatedAssets = await client.assets.getPaginatedAssets(1, false, "TON");
console.log("Paginated Assets:", paginatedAssets);
```

---

## `getPairs`

Fetches a paginated list of asset pairs for a specific asset address.

### Parameters

-   **assetAddress** (`string`): The address of the asset for which to fetch pairs.
-   **page** (`number`, optional): The page number to retrieve. Defaults to `1`.
-   **warning** (`boolean`, optional): Include asset pairs with warnings if set to `true`. Defaults to `false`.
-   **searchPhrase** (`string`, optional): A search phrase to filter the asset pairs.

### Returns

-   `Promise<PaginatedAssets>`: A promise that resolves to a paginated list of asset pairs.

### Example

```typescript
const pairs = await client.assets.getPairs(
    "EQC5...TON-ADDRESS",
    1,
    false,
    "NOT"
);
console.log("Asset Pairs:", pairs);
```

---

### Error Handling

Each function can throw errors if the request fails. It is recommended to use `try-catch` blocks to handle potential issues.

### Example

```typescript
try {
    const TON = await client.assets.getExactAsset("EQC5...TON-ADDRESS");
    console.log(TON);
} catch (error) {
    console.error("Error fetching asset:", error);
}
```

---

### Notes

-   The `token_address` and `assetAddress` parameters must be valid addresses on the TON blockchain.
-   Pagination starts at `1`, and passing `0` or negative values will result in default behavior.
-   The `warning` flag can be useful for filtering out assets or pairs with issues.
