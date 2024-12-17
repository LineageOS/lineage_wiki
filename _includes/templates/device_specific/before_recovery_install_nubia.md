## Flashing additional partitions

{% include alerts/warning.html content="This platform requires additional partitions to be flashed for recovery to work properly, the process to do so is described below." %}

{%- if device.maintainers != empty %}
1. Download the following files from [here](https://download.lineageos.org/devices/{{ device.codename }}).
{%- else %}
1. [Build]({{ device | device_link: "/build" | relative_url }}) a LineageOS installation package. The files will be built as part of it!
{%- endif %}
{%- for partition in device.before_recovery_install.partitions %}
  * {{ partition }}.img
{%- endfor %}
2. Flash the downloaded image files to your device by typing:
  ```
  {%- for partition in device.before_recovery_install.partitions %}
fastboot flash {{ partition }} {{ partition }}.img
  {%- endfor %}
  ```
