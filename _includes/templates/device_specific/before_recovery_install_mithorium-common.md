## Prepare for retrofit dynamic partitions

This device uses retrofit dynamic partitions. However, unlike the other devices, this device requires special steps to initialize it. The process to do so is described below.

1. Power off the device, and boot it into bootloader mode:
  * {{ device.download_boot }}
2. Erase the underlying partitions which would be used for retrofit dynamic partitions on your device:
  ```
fastboot erase cust
fastboot erase system
  {%- if device.codename == "Mi439" %}
fastboot erase vendor
  {%- endif %}
  ```
{% case device.codename %}
{% when 'Mi8917' %}
3. Download `Mi8917-super_empty-raw.img` from [here](https://www.androidfilehost.com/?fid=4279422670115731153)
{% when 'Mi8937' %}
3. Download `Mi8937-super_empty-raw.img` from [here](https://www.androidfilehost.com/?fid=4279422670115731152)
{% when 'Mi439' %}
3. Download `Mi439-super_empty-raw.img` from [here](https://www.androidfilehost.com/?fid=4279422670115731154)
{% endcase %}
4. Flash the downloaded `{{ device.codename }}-super_empty-raw.img` to system partition:
  ```
fastboot flash system {{ device.codename }}-super_empty-raw.img
  ```
