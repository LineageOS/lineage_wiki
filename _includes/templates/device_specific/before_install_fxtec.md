## Enabling offmode charging

 {% include alerts/warning.html content="This platform requires offline charging to be enabled by hand to work properly, the process to do so is described below." %}

 1. Reboot the device into bootloader mode:
     * {{ device.download_boot }}
 2. Enable offline charging by running:
 ```
 fastboot oem enable-charger-screen
 fastboot oem off-mode-charge 1
 fastboot reboot
 ```
