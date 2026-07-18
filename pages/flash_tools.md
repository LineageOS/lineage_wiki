---
sidebar: home_sidebar
title: Using Lineage Flash Tools
permalink: web_flash_tools.html
---

Lineage Flash Tools is a web based utility that lets you flash LineageOS recovery, boot, and OTA packages directly from your browser, without installing [adb and fastboot]({{ "adb_fastboot_guide" | relative_url }}) locally. Access it at [flash.lineageos.org](https://flash.lineageos.org).

The tool provides four separate modes, shown as tabs. Each tab is a self-contained tool with its own connect button and actions:

![]({{ "images/pages/flash_tools_tabs.png" | relative_url }}){: width="50%" }

- **ADB** (Recovery mode)
- **Fastboot** (Fastboot / Fastbootd mode)
- **Odin** (Samsung download mode)
- **Amlogic** (USB burn mode)

As installation steps vary by device, please refer to the device-specific installation instructions.

## Requirements

- A browser supporting [WebUSB](https://caniuse.com/webusb) such as Chrome or Edge.

## Connect your device

### ADB tab

{% include alerts/note.html content="If you have adb already installed locally, run `adb kill-server` before using the web flash tools." %}

1. If your device is already booted into recovery, skip to step 3. Otherwise, enable USB debugging in developer settings.

2. ![]({{ "images/pages/flash_tools_adb_system.png" | relative_url }}){: width="50%" }

   Click **Connect** and select your device from the browser's pop-up list. From here you can use the **Reboot to recovery** or **Reboot to bootloader** buttons to switch the device into the mode you need.

3. In LineageOS recovery, select `Apply update > Apply from ADB` using the touch screen, or use the volume keys to navigate and the power button to select.
4. Click **Connect** again if the device disconnected during the reboot, then select it from the pop-up list.

5. ![]({{ "images/pages/flash_tools_adb_sideload.png" | relative_url }}){: width="50%" }

   Use **Sideload** to select and push a `lineage-*.zip` package to the device.

### Fastboot tab

1. Reboot your device to bootloader mode before connecting.
2. Click **Connect** and select your device from the browser's pop-up list.
3. Use **Boot** to boot an image (e.g. a recovery) once without flashing it, **Flash** to write an image permanently to a chosen partition (e.g. `recovery`), or **Get variable** to read a bootloader variable (e.g. `version-bootloader`) into the log.

### Odin tab

1. Reboot your device to Samsung download mode before connecting.
2. Click **Connect** and select your device from the browser's pop-up list. On Windows, you can instead use serial mode, which skips the need to install Samsung's USB drivers.
3. Select the firmware file(s) to flash and start the flash.

### Amlogic tab

1. Reboot your device to USB burn mode before connecting.
2. Click **Connect** and select your device from the browser's pop-up list.
3. Select the burn image and start the flash.

## Resolve USB transfer errors

Sometimes Android devices have trouble communicating through certain USB ports, cables, or hubs due to the high throughput of data required by the flashing process. To resolve transfer errors:

- Don't use USB hubs, USB extension cables or adapters if possible.
- Try a different USB cable.
- Try a different USB port.

## Need help?

You can find assistance with LineageOS on [our subreddit](https://reddit.com/r/LineageOS), on [our Discord server](https://discord.gg/gD6DMtf), or in [#LineageOS on Libera.Chat](https://web.libera.chat/gamja/?channel=#lineageos).
