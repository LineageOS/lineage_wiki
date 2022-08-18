## Flashing the vendor boot partition

{% include alerts/warning.html content="This platform requires the vendor boot partition to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download vendor_boot file from [here](https://mirror.math.princeton.edu/pub/lineageos/full/{{ device.codename }}/). Download the file named `vendor_boot.img` from the directory named with the latest date.
2. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
3. Flash the downloaded image to your device by typing (replace `<vendor_boot>` with the actual filename!):
```
fastboot flash vendor_boot <vendor_boot>.img
```
