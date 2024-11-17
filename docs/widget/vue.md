---
title: VueJS Setup
description: A step-by-step guide to integrate the MyTonSwap Widget into your Vue.js application.
sidebar_position: 5
keywords:
    - MyTonSwap
    - Widget
    - DEX Aggregator
    - Token Swap
    - Vue.js
    - Integration
author: MyTonSwap Team
tags:
    - setup
    - guide
    - vue
    - javascript
---

# MyTonSwap Widget Example

**Widget example for Vue.js using a package manager**

👨‍💻 [Code Example](https://github.com/MyTonSwap/widget/tree/main/examples/vue)

## Install the Widget using a Package Manager

To start, install the **MyTonSwap Widget** using your preferred package manager:

```bash
npm i @mytonswap/widget
```

Or using **yarn** or **pnpm**:

```bash
# Using yarn
yarn add @mytonswap/widget

# Using pnpm
pnpm add @mytonswap/widget
```

## Use the Widget in Your Vue.js Application

### Step 1: Create the Vue Component

In your Vue component, you can integrate the **MyTonSwap Widget** and **TonConnectUI** as follows:

#### `your-component.vue`

```vue
<script setup lang="ts">
import { createSwap } from "@mytonswap/widget";
import { TonConnectUI } from "@tonconnect/ui";
import { onMounted, ref } from "vue";

const isMounted = ref(false);

onMounted(() => {
    if (!isMounted.value) {
        // Initialize TonConnectUI instance
        const tonConnectUI = new TonConnectUI({
            manifestUrl: "https://mytonswap.com/wallet/manifest.json", // Your manifest URL for TonConnect integration
        });

        // Initialize the MyTonSwap Widget
        createSwap("mytonswap-widget", { tonConnectInstance: tonConnectUI });

        // Mark as mounted to avoid re-initialization
        isMounted.value = true;
    }
});
</script>

<template>
    <!-- The div where the MyTonSwap widget will be rendered -->
    <div id="mytonswap-widget"></div>
</template>
```

### Step 2: Add Global Styles

You can customize the appearance of the widget by defining some global CSS variables. For example, in your `global.css` or the relevant CSS file:

#### `global.css` or `index.css`

```css
:root {
    --border-color: #f4f4f5;
    --primary-color: #22c55e;
    --secondary-color: #ebebeb;
    --background-color: #ffffff;
    --modal-background-color: #ffffff;
    --swap-container-background: #f4f4f5;
    --swap-container-border-color: #ffffff;
    --input-card-color: #ffffff;
    --input-card-pay-color: #ffffff;
    --input-card-receive-color: #d0d5dd;
    --input-token-color: #f4f4f5;
    --change-direction-background-color: #22c55e;
    --change-direction-icon-color: #f4f4f5;
    --light-shade-color: #f4f4f5;
    --slippage-box-color: #71717a;
    --text-black-color: #000000;
    --text-white-color: #ffffff;
    --text-fade-color: #9caacb;
    --skeleton-shine-color: #9c9c9c;
    --price-impact-color: #e64646;
}
```

These custom styles will affect various elements of the widget, such as background colors, borders, and text. You can further tweak these values to match your application's design.

Visit your application in the browser, and you should see the **MyTonSwap Widget** ready for use!

---

**Additional Notes**:

-   Ensure you are passing the correct `tonConnectInstance` to the widget for wallet connections.
-   You can further customize the widget through additional options passed to `createSwap` in the script.
-   The CSS variables can be modified to better align with your app’s branding and theme.

## Troubleshooting

-   **Widget Not Showing**: Ensure the `elementId` matches the ID of the HTML element you’re rendering the widget in.
-   **Styling Issues**: Make sure your defined the css variables and CSS does not conflict with the widget’s default styles.

## Need Help?

If you run into any issues or have questions, feel free to visit our [GitHub Issues](https://github.com/Ho3einWave/mytonswap-widget/issues) page for support.
