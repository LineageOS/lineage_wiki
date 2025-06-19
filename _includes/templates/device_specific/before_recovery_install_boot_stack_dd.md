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
2. Place the files on the root of `/sdcard`:
   * Using adb:
      ```
{%- for partition in device.before_recovery_install.partitions %}
      adb -d push {{ partition }}.img /sdcard/{{ partition }}.img
{%- endfor %}
      ```
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
3. Now, open an `adb -d shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window. In that shell, type the following commands:
{%- if device.is_ab_device %}
```
su
{%- for partition in device.before_recovery_install.partitions %}
dd if=/sdcard/{{ partition }}.img of={{ device.boot_stack_path }}{{ partition }}_a
dd if=/sdcard/{{ partition }}.img of={{ device.boot_stack_path }}{{ partition }}_b
{%- endfor %}
```
{%- else %}
```
su
{%- for partition in device.before_recovery_install.partitions %}
dd if=/sdcard/{{ partition }}.img of={{ device.boot_stack_path }}{{ partition }}
{%- endfor %}
```
{%- endif %}
