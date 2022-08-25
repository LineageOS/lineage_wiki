## Flashing the dtbo and vendor boot partitions

{% include alerts/warning.html content="This platform requires the dtbo partition to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download dtbo and vendor_boot files from [here](https://mirror.math.princeton.edu/pub/lineageos/full/{{ device.codename }}/). Download the files named `dtbo.img` from the directory named with the latest date.
2. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
3. Flash the downloaded image files to your device by typing (replace `<dtbo>` with the actual filenams!):
```
fastboot flash dtbo <dtbo>.img
```
