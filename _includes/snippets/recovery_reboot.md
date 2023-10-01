{%- case device.recovery_reboot %}
{%- when 'fastboot_menu' %}
Use the menu to navigate to and to select the `Recovery` option.
{%- when 'fastboot_boot' %}
```
fastboot boot {{ device.recovery_partition_name }}.img
```
{%- when 'fastboot_reboot' %}
Type the command:
```
fastboot reboot-recovery
```
{%- else %}
{%- endcase %}
