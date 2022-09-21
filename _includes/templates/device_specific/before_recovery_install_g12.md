## Flashing the dtb and dtbo partitions

 {% include alerts/warning.html content="This platform requires the dtb and dtbo partitions to be flashed for recovery to work properly, the process to do so is described below." %}

 1. Download dtb and dtbo files from [here](https://mirror.math.princeton.edu/pub/lineageos/full/{{ device.codename }}/)
 2. Reboot the device into bootloader mode:
     * {{ device.download_boot }}
 3. Flash the downloaded image files to your device by running (replace `<dtb>` and `<dtbo>` with the actual filenames!):
 ```
 fastboot flash dtb <dtb>.img
 fastboot flash dtbo <dtbo>.img
 ```
