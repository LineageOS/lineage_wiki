## Prepare for retrofit dynamic partitions

{% include alerts/important.html content="This device uses retrofit dynamic partitions. However, unlike the other devices, This device requires special steps to initialize it. the process to do so is described below." %}

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
3. Download `{{ device.codename }}-super_empty-raw.img` from [here](https://github.com/Mi-Thorium/super_empty/raw/master/{{ device.codename }}-super_empty-raw.img)
4. Flash the downloaded `{{ device.codename }}-super_empty-raw.img` to system partition:
  ```
fastboot flash system {{ device.codename }}-super_empty-raw.img
  ```