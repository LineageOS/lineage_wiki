---
sidebar: home_sidebar
title: Using Lineage Flash Tools
permalink: web_flash_tools.html
---

Lineage Flash Tools is a web based utility that allows you to run some select adb and fastboot commands to install LineageOS recovery and OTA packages without installing [adb and fastboot](adb_fastboot_guide.html) locally. Access it on our downloads page here: [https://download.lineageos.org/flash](https://download.lineageos.org/flash).

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
2. Select `Apply update > Apply from ADB` using the touch screen, or use the volume keys to navigate and the power button to select.
3. Press the connect button and select your device from the pop-up list.

### Supported commands

1. `fastboot boot path/to/image.img`
2. `fastboot flash <partition> path/to/partition.img` (e.g. `recovery`)
3. `fastboot getvar <var>` (e.g. `version-bootloader`)
4. `adb -d sideload path/to/lineage-*.zip`

## Resolve USB transfer errors

Sometimes Android devices have trouble communicating through certain USB ports or hubs due to the high throughput of data. To resolve transfer errors:

- Don't use USB hubs, USB extension cables or adapters if possible.
- Try a different USB cable.
- Try a different USB port.

## Need help?

You can find assistance with LineageOS on [our subreddit](https://reddit.com/r/LineageOS), on [our Discord server](https://discord.gg/gD6DMtf), or in [#LineageOS on Libera.Chat](https://web.libera.chat/gamja/?channel=#lineageos).
