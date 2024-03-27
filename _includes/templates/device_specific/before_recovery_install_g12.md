## Flashing the dtb and dtbo partitions

 {% include alerts/warning.html content="This platform requires the dtb and dtbo partitions to be flashed for recovery to work properly, the process to do so is described below." %}

 1. Download dtbo file from [here](https://download.lineageos.org/devices/{{ device.codename }}), and dtb file from [here](https://download.ods.ninja/Android/firmware/{{ device.codename }}/dtb), Rename the dtb to dtb.img.
 2. Reboot the device into bootloader mode:
     * {{ device.download_boot }}
 3. Flash the downloaded image files to your device by running:
 ```
 fastboot flash dtb dtb.img
 fastboot flash dtbo dtbo.img
 ```
