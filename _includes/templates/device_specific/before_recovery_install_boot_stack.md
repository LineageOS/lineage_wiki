## Flashing additional partitions

{% include alerts/warning.html content="This platform requires additional partitions to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download the following files from [here](https://download.lineageos.org/devices/{{ device.codename }}).
{%- for partition in device.before_recovery_install.partitions %}
  * {{ partition }}.img
{%- endfor %}
2. Power off the device, and boot it into bootloader mode:
  * {{ device.download_boot }}
3. Flash the downloaded image files to your device by typing (replace `<...>` with the actual filenames!):
  ```
  {%- for partition in device.before_recovery_install.partitions %}
fastboot flash {{ partition }} <{{ partition }}>.img
  {%- endfor %}
  ```
