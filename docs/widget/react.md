---
title: ReactJS Setup
description: A detailed guide to integrating the MyTonSwap Widget into your ReactJS application.
sidebar_position: 4
keywords:
    - MyTonSwap
    - Widget
    - DEX Aggregator
    - Token Swap
    - ReactJS
    - Integration
author: MyTonSwap Team
tags:
    - setup
    - guide
    - react
    - javascript
---

# Setting Up MyTonSwap Widget in ReactJS

This guide will show you how to integrate the **MyTonSwap Widget** into your ReactJS application.

👨‍💻 [Code Example](https://github.com/MyTonSwap/widget/tree/main/examples/react)

## Prerequisites

-   A ReactJS application (you can create one with `create-react-app` or any other React setup).
-   Node.js and npm installed on your computer.

## Step 1: Install the MyTonSwap Widget

First, you need to install the **MyTonSwap Widget** package in your React project. You can use **npm**, **yarn**, or **pnpm** to add the widget.

```bash
# Using npm
npm install @mytonswap/widget

# Using yarn
yarn add @mytonswap/widget

# Using pnpm
pnpm add @mytonswap/widget
```

## Step 2: Import the Widget in Your React Component

In the React component where you want to display the widget, import the **MyTonSwap Widget**:

```javascript
import React, { useEffect } from "react";
import { createSwap } from "@mytonswap/widget";

const MyTonSwapWidget = () => {
    const [tc] = useTonConnectUI();
    const initMount = useRef(false);

    useEffect(() => {
        if (tc) {
            if (initMount) {
                return;
            }
            initMount.current = true;
            createSwap("swap-component", { tonConnectInstance: tc });
        }
    }, [tc]);

    return (
        <div
            id="swap-component"
            style={{ width: "100%", height: "100%" }}
        ></div>
    );
};

export default MyTonSwapWidget;
```

## Step 3: Use the Widget in Your Application

Now that you've set up the widget in your React component, you can use it like any other component in your application. For example, add it to your main `App.js` or another component:

```javascript
import React from "react";
import MyTonSwapWidget from "./MyTonSwapWidget";

const App = () => {
    return (
        <div className="App">
            <h1>MyTonSwap Widget</h1>
            <MyTonSwapWidget />
        </div>
    );
};

export default App;
```

## Step 4: Customize the Widget

You can customize the widget’s appearance. For instance:

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

Visit your application in the browser, and you should see the **MyTonSwap Widget** ready to perform token swaps!

---

**Additional Notes**:

-   Ensure you are passing the correct `tonConnectInstance` to the widget for wallet connections.
-   You can further customize the widget through additional options passed to `createSwap` in the script.
-   The CSS variables can be modified to better align with your app’s branding and theme.

## Troubleshooting

-   **Widget Not Showing**: Ensure the `elementId` matches the ID of the HTML element you’re rendering the widget in.
-   **Styling Issues**: Make sure your defined the css variables and CSS does not conflict with the widget’s default styles.

## Next Steps

-   Explore guides for setting up the widget in other frameworks like [VueJS](./vue) and [HTML](./html).

## Need Help?

If you have any issues or questions, please visit our [GitHub Issues](https://github.com/mytonswap/widget/issues) page.

---

© 2024 MyTonSwap. All rights reserved.
