## Flashing the dtbo and vendor boot partitions

{% include alerts/warning.html content="This platform requires the dtbo and vendor boot partitions to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download dtbo and vendor_boot file from [here]({{ device.dtbo_and_vendor_boot_download_link }}). {{ device.dtbo_and_vendor_boot_download_link_instructions }}
2. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
3. Flash the downloaded image to your device by typing (replace `<dtbo>` and `<vendor_boot>` with the actual filenames!):
```
fastboot flash dtbo <dtbo>.img
fastboot flash vendor_boot <vendor_boot>.img
```
