{% assign device = site.data.devices[page.device] %}

## Wireless Chipset

This device has multiple revisions that contain different Wi-Fi/Bluetooth chipsets.

One utilizes a Broadcom (BCM) chipset, and the other uses a Realtek (RTK) chipset

To discern this, ensure [ADB is enabled](https://wiki.lineageos.org/adb_fastboot_guide#setting-up-adb) as guided on the previous page, then connect the device to your host machine via a USB-A (male) to USB-A (male) cable.

Then, on your host machine run the following command:
```
adb shell lsmod | grep dhd
```

If the command returns something containing the phase "dhd", you have the Broadcom chipset, which is supported by the [nicepool](https://wiki.lineageos.org/devices/nicepool/) build.

If the command returns nothing, you have the Realtek chipset, which is supported by the [nicepool_rtk](https://wiki.lineageos.org/devices/nicepool_rtk/) build.

Please select the relevant build above based on this information, and proceed with that device's installation guide.

{% include templates/device_specific/before_install_needs_specific_android_fw.md %}
