## Prepare for retrofit dynamic partitions

{% include alerts/important.html content="This device uses retrofit dynamic partitions, Underlying partitions used for it needs to be erased firstly. the process to do so is described below." %}

1. Power off the device, and boot it into bootloader mode:
  * {{ device.download_boot }}
2. Erase underlying partitions which would be used for retrofit dynamic partitions on your device:
  ```
fastboot erase cust
fastboot erase system
  {%- if device.codename == "Mi439" %}
fastboot erase vendor
  {%- endif %}
  ```

{% if device.codename == "Mi439" %}
## Flashing additional partitions

{% include alerts/warning.html content="This platform requires additional partitions to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download the following files from [here](https://download.lineageos.org/devices/{{ device.codename }}).
  * dtbo.img
  * vbmeta.img
2. Flash the downloaded image files to your device by typing (replace `<...>` with the actual filenames!):
  ```
fastboot flash dtbo <dtbo>.img
fastboot flash vbmeta <vbmeta>.img
  ```
{% endif %}
