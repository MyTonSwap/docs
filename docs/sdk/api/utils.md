---
title: "Utility Functions"
description: "A collection of utility functions for handling nano unit conversions and precision adjustments in the mytonswap SDK."
category: "Utils"
version: "1.0.0"
date: "2024-11-16"
author: "Hosein Baseri"
tags:
    - "Conversion"
    - "Nano Units"
    - "Precision"
    - "BigInt"
    - "Utility"
---

## Overview

The `utils` module provides utility functions for converting between human-readable values and nano units, which are used in blockchain systems. These utilities help in handling and adjusting precision, especially in scenarios where blockchain assets are involved, such as in the TON ecosystem.

### **`toNano` Function**

#### **Description:**

The `toNano` function converts a given number, string, or bigint to a `bigint` representation in nano units, considering the specified number of decimals (default is 9). Nano units are commonly used in blockchain systems for precise representation of values.

#### **Parameters:**

-   **`src`** (`number | string | bigint`): The source value to convert. It can be a:
    -   `number`: A number to be converted.
    -   `string`: A string representing a numerical value (e.g., `"123.456"`).
    -   `bigint`: A `bigint` value.
-   **`decimals`** (`number`, optional): The number of decimal places to consider for the conversion. Defaults to `9` decimals (common in TON blockchain).

#### **Returns:**

-   **`bigint`**: The converted value as a `bigint`, representing the given value in nano units.

#### **Throws:**

-   Throws an `Error` if:
    -   The input number is not finite (for `number` types).
    -   The input string is not a valid number or does not have enough precision.
    -   The input value doesn't have enough precision to be represented properly.

#### **Example Usage:**

```javascript
const nanoValue = toNano("123.456"); // Converts the string '123.456' to a bigint representing the value in nano units
console.log(nanoValue); // Output: 123456000000000
```

---

### **`fromNano` Function**

#### **Description:**

The `fromNano` function converts a value from nano units (in `bigint`, `number`, or `string` format) to a human-readable string representation with the specified number of decimals (default is 9). This is useful for displaying values in a more understandable format (e.g., `TON` tokens).

#### **Parameters:**

-   **`src`** (`bigint | number | string`): The source value in nano units. It can be:
    -   `bigint`: A `bigint` representing the value in nano units.
    -   `number`: A number representing the value in nano units.
    -   `string`: A string representing the value in nano units.
-   **`decimals`** (`number`, optional): The number of decimal places to include in the output string. Defaults to `9`.

#### **Returns:**

-   **`string`**: The converted value as a string with the specified number of decimal places.

#### **Example Usage:**

```javascript
const humanReadableValue = fromNano(123456000000000n); // Converts from nano units to a human-readable string
console.log(humanReadableValue); // Output: '123.456'
```

#### **Notes:**

-   This function automatically adjusts the decimal places and ensures that trailing zeroes are appropriately removed.
-   It is ideal for displaying the value in user interfaces where human-readable tokens are needed.

---

### **Usage Example with Both Functions:**

```javascript
// Convert a string to nano units
const nanoAmount = toNano("123.456");

// Convert nano units back to a human-readable string
const readableAmount = fromNano(nanoAmount);

console.log(nanoAmount); // 123456000000000
console.log(readableAmount); // '123.456'
```

---

### **Summary**

-   **`toNano`** is used to convert numerical values to nano units as a `bigint`.
-   **`fromNano`** is used to convert nano units back to human-readable format as a string.
-   These functions handle various formats (`number`, `string`, `bigint`) and ensure correct precision when converting between standard and nano units.
