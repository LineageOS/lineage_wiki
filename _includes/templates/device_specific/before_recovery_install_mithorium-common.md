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
