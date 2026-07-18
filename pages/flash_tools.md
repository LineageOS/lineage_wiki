---
sidebar: home_sidebar
title: Using Lineage Flash Tools
permalink: web_flash_tools.html
---

Lineage Flash Tools is a web based utility that lets you flash LineageOS recovery, boot, and OTA packages directly from your browser, without installing [adb and fastboot]({{ "adb_fastboot_guide" | relative_url }}) locally. Access it at [flash.lineageos.org](https://flash.lineageos.org).

The tool provides four separate modes, shown as tabs. Each tab is a self-contained tool with its own connect button and actions:

<div class="img-container">
  <img src="{{ 'images/pages/flash_tools_tabs_light.png' | relative_url }}" class="only-light">
  <img src="{{ 'images/pages/flash_tools_tabs_dark.png' | relative_url }}" class="only-dark">
</div>

- **ADB** (Recovery mode)
- **Fastboot** (Fastboot / Fastbootd mode)
- **Odin** (Samsung download mode)
- **Amlogic** (USB burn mode)

As installation steps vary by device, please refer to the device-specific installation instructions.

## Requirements

- A browser supporting [WebUSB](https://caniuse.com/webusb) such as Chrome or Edge.
- on Windows: You may need to install the appropriate [USB drivers](https://developer.android.com/studio/run/win-usb) for WebUSB to detect your device in ADB/Fastboot mode.
- on Linux: You may need to configure `udev` rules to allow browser access to USB devices. (Not required on distributions using systemd v261 or newer.)

## Connect your device

### ADB tab

{% include alerts/note.html content="If you have adb already installed locally, run `adb kill-server` before using the web flash tools." %}

1. If your device is already booted into recovery, skip to step 3. Otherwise, enable USB debugging in developer options.
2. Click **Connect** and select your device from the browser's pop-up list.

   <div class="img-container">
      <img src="{{ 'images/pages/flash_tools_adb_system_light.png' | relative_url }}" class="only-light">
      <img src="{{ 'images/pages/flash_tools_adb_system_dark.png' | relative_url }}" class="only-dark">
   </div>

   From here you can use the **Reboot recovery** or **Reboot bootloader** buttons to reboot the device into the mode you need.

3. In LineageOS recovery, select `Apply update > Apply from ADB` using the touch screen, or use the volume keys to navigate and the power button to select.
4. Click **Connect** again if the device disconnected during the reboot, then select it from the pop-up list.

   <div class="img-container">
      <img src="{{ 'images/pages/flash_tools_adb_sideload_light.png' | relative_url }}" class="only-light">
      <img src="{{ 'images/pages/flash_tools_adb_sideload_dark.png' | relative_url }}" class="only-dark">
   </div>

   Use **Choose ZIP** to select a `lineage-*.zip` package, then click **Sideload** to sideload it to the device.

### Fastboot tab

1. Reboot your device to bootloader mode before connecting.
2. Click **Connect** and select your device from the browser's pop-up list.
3. Use the available actions:

| Action              | Purpose                                                                                                                  |
| :------------------ | :----------------------------------------------------------------------------------------------------------------------- |
| **Boot image**      | Temporarily boot an image, such as LineageOS Recovery, without flashing it.                                              |
| **Flash image**     | Flash an image to a selected partition (for example, installing LineageOS Recovery to `recovery`).                       |
| **Wipe super**      | Erase and recreate dynamic partitions using `super_empty.img` (required for some retrofitted dynamic partition devices). |
| **Get variable**    | Read a bootloader variable, such as `version-bootloader` or the active slot.                                             |
| **Set active slot** | Switch the active slot (A/B devices).                                                                                    |
| **Reboot**          | Restart the device into the system, recovery, or bootloader.                                                             |
| **Run command**     | Execute a custom fastboot command, such as `flashing unlock`.                                                            |
{: .table }

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
