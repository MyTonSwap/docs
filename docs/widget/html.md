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

👨‍💻 [Code Example](https://github.com/MyTonSwap/widget/tree/main/examples/html)

## Prerequisites

-   A basic understanding of HTML and JavaScript.
-   An HTML file where you want to embed the widget.

## Step 1: Include the MyTonSwap Widget Script

You can load the MyTonSwap Widget directly from a CDN. Add the following script tag inside the `<head>` or just before the closing `<body>` tag of your HTML file:

```html
<!-- Include MyTonSwap Widget from CDN -->
<script
    type="module"
    src="https://cdn.jsdelivr.net/npm/@mytonswap/widget@latest/dist/cdn/mytonswap-widget.js"
></script>
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
        manifestUrl: "https://mytonswap.com/wallet/manifest.json",
    });
    createSwap("swap-widget", { tonConnectInstance: tonConnectUI });
</script>
```

### Configuration Options

## Step 4: Customize the Widget

You can customize the widget’s appearance. Here’s an example:

```js
            createSwap("swap-component", {
                tonConnectInstance: tc
                options: {
                    ui_preferences: {
                        primary_color: "#1456fb",
                        dark_color: "#0d1017",
                    },
                },
            });
```

---

**Additional Notes**:

-   Ensure you are passing the correct `tonConnectInstance` to the widget for wallet connections.
-   You can further customize the widget through additional options passed to `createSwap` in the script.

## Troubleshooting

-   **Widget Not Showing**: Ensure the `elementId` matches the ID of the HTML element you’re rendering the widget in.
-   **Styling Issues**: Make sure your defined the css variables and CSS does not conflict with the widget’s default styles.

## Next Steps

For setup in other frameworks, check out:

-   [ReactJS Setup Guide](./react)
-   [VueJS Setup Guide](./vue)

## Need Help?

If you have any questions or run into issues, please visit our [GitHub Issues](https://github.com/Ho3einWave/mytonswap-widget/issues) page.

---

© 2024 MyTonSwap. All rights reserved.
