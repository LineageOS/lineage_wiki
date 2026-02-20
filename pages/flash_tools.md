---
sidebar: home_sidebar
title: Using Lineage Flash Tools
permalink: web_flash_tools.html
---

Lineage Flash Tools is a web based utility that implements common `fastboot flash` and `fastboot boot` commands, as well as `adb sideload` to install LineageOS recovery and OTA packages without installing [fastboot and adb](adb_fastboot_guide.html) locally. Access it on our downloads page here: [https://download.lineageos.org/flash](https://download.lineageos.org/flash).

As installation steps vary by device, please refer to device-specific installation instructions.

## Requirements

- A browser supporting [WebUSB](https://caniuse.com/webusb) such as Chrome or Edge.

## Connect your device

### Fastboot client

1. Reboot your device to fastboot mode before connecting to the fastboot client.
2. Press the connect button and select your device from the pop-up list.

### ADB client

{% include alerts/note.html content="If you have adb already installed locally, run `adb kill-server` before using the web flash tools." %}

1. Reboot your device to recovery mode before connecting to the adb client.
2. Select `Apply update > Apply from ADB` using the touch screen, or with the volume keys to change selection and power button to select.
3. Press the connect button and select your device from the pop-up list.

## Resolve USB transfer errors

Sometimes Android devices have trouble communicating through certain USB ports or hubs due to the high throughput of data. To resolve transfer errors:

- Don't use USB hubs, USB extension cables or adapters if possible.
- Try a different USB cable.
- Try a different USB port.

## To get assistance

- [#LineageOS-dev](https://web.libera.chat/gamja/?channel=#lineageos-dev) - A helpful, real-time chat room (or "channel"), on the Libera.Chat [IRC](https://en.wikipedia.org/wiki/Internet_Relay_Chat) network. We also have a [Discord Server](https://discord.gg/gD6DMtf) which is bridged with IRC.
