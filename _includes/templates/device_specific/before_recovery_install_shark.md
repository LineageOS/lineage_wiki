## Flashing the dtbo partition

 {% include alerts/warning.html content="This platform dtbo partition to be flashed for recovery to work properly, the process to do so is described below." %}

 1. Download dtbo.img file from [here](https://download.lineageos.org/devices/{{ device.codename }}).
 2. Reboot the device into bootloader mode:
     * {{ device.download_boot }}
 3. Flash the downloaded image files to your device by running:
 ```
 fastboot flash dtbo dtbo.img
 ```
