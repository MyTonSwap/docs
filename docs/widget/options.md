---
title: Widget Options
description: Detailed guide on the available options to customize the MyTonSwap Widget.
sidebar_position: 6
keywords:
  - MyTonSwap
  - Widget
  - DEX Aggregator
  - Customization
  - Options
author: MyTonSwap Team
tags:
  - options
  - customization
  - widget
  - setup
  - configuration
---
# MyTonSwap Widget Options

The **MyTonSwap Widget** provides several customizable options that allow you to tailor the widget's behavior and appearance. Below are the detailed options you can use when setting up the widget.

## Available Options

<details>
<summary><strong>Default Tokens</strong></summary>

You can specify default tokens to be displayed in the swap interface by passing the `default_pay_token` and `default_receive_token` properties to the `createSwap` function.

```tsx
function App() {
    const [tc] = useTonConnectUI();
    useEffect(() => {
        if (tc) { 
          createSwap("swap-component", {
              tonConnectInstance: tc,
              options: {
                  default_pay_token:
                      "EQD4P32U10snNoIavoq6cYPTQR82ewAjO20epigrWRAup54_",
                  default_receive_token:
                      "EQD-cvR0Nz6XAyRBvbhz-abTrRC6sI5tvHvvpeQraV9UAAD7",
              },
          });
        }
    }, [tc]);
    return (
        <div className="App">
            <div id="swap-component"></div>
        </div>
    );
}
```

### Options:
- `default_pay_token`: The default token for the "pay" side of the swap.
- `default_receive_token`: The default token for the "receive" side of the swap.

</details>

<details>
<summary><strong>Pinned Tokens</strong></summary>

You can pin specific tokens to the top of the token selection list by using the `pin_tokens` property. This ensures that these tokens are always easily accessible to users.

```tsx
function App() {
    const [tc] = useTonConnectUI();
    useEffect(() => {
        if(tc){
          createSwap("swap-component", {
              tonConnectInstance: tc,
              options: {
                  pin_tokens: [
                      "EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c",
                      "EQD-cvR0Nz6XAyRBvbhz-abTrRC6sI5tvHvvpeQraV9UAAD7",
                  ],
              },
          });
        }
    }, [tc]);
    return (
        <div className="App">
            <div id="swap-component"></div>
        </div>
    );
}
```

### Options:
- `pin_tokens`: An array of token addresses to pin at the top of the token selection list.

</details>

<details>
<summary><strong>AppId</strong></summary>

This feature allows partners to be uniquely identified when using the widget. This helps with better tracking and analytics for partner-related swaps.

```tsx
function App() {
    const [tc] = useTonConnectUI();
    useEffect(() => {
        if (tc) {
          createSwap("swap-component", {
              tonConnectInstance: tc,
              options: {
                  app_id: "your_app_id",
              },
          });
        }
    }, [tc]);
    return (
        <div className="App">
            <div id="swap-component"></div>
        </div>
    );
}
```

### Options:
- `app_id`: A unique identifier for your application, useful for tracking swaps and analytics.

</details>

<details>
<summary><strong>Default Slippage</strong></summary>

Set a default slippage percentage to control the allowable price difference during a swap transaction. It helps to ensure that the swap is completed even if the price fluctuates slightly.

### Option:
- `default_slippage`: A number indicating the default slippage percentage. For example, `1` for 1% slippage.

</details>

<details>
<summary><strong>Lock Tokens</strong></summary>

You can lock the tokens to prevent users from changing them. This is useful in scenarios where you want to restrict the swapping options.

### Options:
- `lock_pay_token`: Lock the "pay" token so it cannot be changed by the user.
- `lock_receive_token`: Lock the "receive" token so it cannot be changed by the user.
- `lock_input`: Lock the input fields to prevent users from modifying the swap amount.

</details>

<details>
<summary><strong>Default Pay Amount</strong></summary>

You can set a default pay amount for the swap. This can be useful when you want to pre-fill the "pay" amount for users.

### Option:
- `default_pay_amount`: A string representing the default amount to be paid in the swap.

</details>

<details>
<summary><strong>UI Preferences</strong></summary>

Customize the user interface with the following preferences. You can enable or disable certain UI components based on your needs.

```tsx
const uiPreferences = {
    disable_provided_text: true, // Disable text provided by the widget
    show_swap_details: false, // Show detailed swap information
    show_settings_wallet: true, // Show wallet settings
    show_settings_slippage: true, // Show slippage settings
    show_settings_community: true, // Show community settings
    show_change_direction: false, // Show option to change the swap direction
    show_settings: true, // Show the general settings
    show_refresh: true, // Show refresh button
};
```

### Options:
- `disable_provided_text`: Disable the provided text in the widget.
- `show_swap_details`: Show or hide the swap details section.
- `show_settings_wallet`: Show or hide wallet settings.
- `show_settings_slippage`: Show or hide slippage settings.
- `show_settings_community`: Show or hide community settings.
- `show_change_direction`: Show or hide the option to change the swap direction.
- `show_settings`: Show or hide the settings section.
- `show_refresh`: Show or hide the refresh button.

</details>

## Summary of Options

| Option                    | Description                                                            |
|---------------------------|------------------------------------------------------------------------|
| `default_pay_token`        | Default token for the "pay" side of the swap.                         |
| `default_receive_token`    | Default token for the "receive" side of the swap.                     |
| `default_slippage`         | Default slippage percentage for the swap.                             |
| `lock_pay_token`           | Lock the "pay" token to prevent changes.                              |
| `lock_receive_token`       | Lock the "receive" token to prevent changes.                          |
| `lock_input`               | Lock the input fields to prevent changes in the swap amount.          |
| `default_pay_amount`       | Default amount to be paid in the swap.                                |
| `pin_tokens`               | An array of tokens to pin at the top of the token selection list.     |
| `app_id`                   | Unique identifier for the partner application for better tracking.   |
| `layout_direction`         | Set the UI layout direction ("ltr" or "rtl").                         |
| `ui_preferences`           | Customize which parts of the UI to show or hide.                      |

These options provide flexibility to ensure the **MyTonSwap Widget** works the way you need it to in your application.

---
© 2024 MyTonSwap. All rights reserved.
