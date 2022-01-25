## Flashing the vendor boot partition

{% include alerts/warning.html content="This platform requires the vendor boot partition to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download [this]({{ device.vendor_boot_download_link }}) `vendor_boot.img` file.
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Flash a the downloaded images to your device by typing (replace `<vendor_boot>` with the actual filename!):

```
fastboot flash vendor_boot <vendor_boot>.img
```
