---
title: HTML Setup
description: A simple guide to integrating the MyTonSwap Widget into your web application using plain HTML and JavaScript.
sidebar_position: 3
keywords:
  - MyTonSwap
  - Widget
  - DEX Aggregator
  - Token Swap
  - HTML
  - JavaScript
author: MyTonSwap Team
toc: true
tags:
  - setup
  - guide
  - html
  - javascript
---

# Setting Up MyTonSwap Widget with HTML and JavaScript

This guide walks you through integrating the **MyTonSwap Widget** into a web page using plain HTML and JavaScript. This setup is ideal for projects that do not use frameworks like React or Vue.

## Prerequisites

- A basic understanding of HTML and JavaScript.
- An HTML file where you want to embed the widget.

## Step 1: Include the MyTonSwap Widget Script

You can load the MyTonSwap Widget directly from a CDN. Add the following script tag inside the `<head>` or just before the closing `<body>` tag of your HTML file:

```html
<!-- Include MyTonSwap Widget from CDN -->
<script type="module"
        src="https://cdn.jsdelivr.net/npm/@mytonswap/widget@latest/dist/cdn/mytonswap-widget.js"></script>
<style>
```

## Step 2: Create an HTML Container

Create a `<div>` element where the widget will be rendered:

```html
<!-- Widget Container -->
<div id="mytonswap-widget"></div>
```

You can place this container anywhere in your HTML where you want the widget to appear.

## Step 3: Initialize the Widget

In your JavaScript file or inside a `<script>` tag, use the `createSwap` function to initialize the widget:

```html
    <script>
        const tonConnectUI = new TON_CONNECT_UI.TonConnectUI({
            manifestUrl: 'https://mytonswap.com/wallet/manifest.json',
        });
        createSwap("swap-widget", { tonConnectInstance: tonConnectUI });
    </script>
```

### Configuration Options


## Step 4: Customize the Widget

You can customize the widget’s appearance using CSS. Here’s an example:

```html
<style>
    :root {
        --border-color: #f4f4f5;
        --primary-color: #22c55e;
        --background-color: #ffffff;
        --input-card-color: #ffffff;
        --input-token-color: #f4f4f5;
        --light-shade-color: #f4f4f5;
        --slippage-box-color: #71717a;
        --text-black-color: #000000;
        --text-white-color: #ffffff;
        --text-fade-color: #9caacb;
        --skeleton-shine-color: #9c9c9c;
        --price-impact-color: #e64646;
    }
</style>
```

---

**Additional Notes**:
- Ensure you are passing the correct `tonConnectInstance` to the widget for wallet connections.
- You can further customize the widget through additional options passed to `createSwap` in the script.
- The CSS variables can be modified to better align with your app’s branding and theme.


## Troubleshooting

- **Widget Not Showing**: Ensure the `elementId` matches the ID of the HTML element you’re rendering the widget in.
- **Styling Issues**: Make sure your defined the css variables and CSS does not conflict with the widget’s default styles.


## Next Steps

For setup in other frameworks, check out:
- [ReactJS Setup Guide](./react)
- [VueJS Setup Guide](./vue)

## Need Help?

If you have any questions or run into issues, please visit our [GitHub Issues](https://github.com/Ho3einWave/mytonswap-widget/issues) page.

---

© 2024 MyTonSwap. All rights reserved.
