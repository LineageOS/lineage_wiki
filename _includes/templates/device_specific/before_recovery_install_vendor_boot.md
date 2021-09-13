## Pre-install instructions

{% include alerts/warning.html content="This platform requires the vendor boot partition to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download [this]({{ device.vendor_boot_download_link }}) `vendor_boot.img` file.
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Flash a the downloaded images to your device by typing:
```
fastboot flash vendor_boot vendor_boot.img
```

{% include alerts/tip.html content="The file may not be named identically to what stands in the above command, so adjust accordingly." %}
