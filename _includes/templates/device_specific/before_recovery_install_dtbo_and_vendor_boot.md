## Flashing the dtbo and vendor boot partitions

{% include alerts/warning.html content="This platform requires the dtbo and vendor boot partitions to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download the following files from the directory named with the latest date [here](https://mirror.math.princeton.edu/pub/lineageos/full/{{ device.codename }}/).
{% for partition in device.before_recovery_install_args.partitions %}
  * {{ partition }}.img
{% endfor %}
2. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
3. Flash the downloaded image files to your device by typing (replace `<...>` with the actual filenames!):
```
{% for partition in device.before_recovery_install_args.partitions %}
fastboot flash {{ partition }} {{ partition }}.img
{% endfor %}
```
