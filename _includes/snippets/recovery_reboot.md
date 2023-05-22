{% if device.has_recovery_partition != true %}
    {% assign recovery_partition = 'boot' %}
{% else %}
    {% assign recovery_partition = 'recovery' %}
{% endif %}

{%- case device.recovery_reboot %}
{%- when 'fastboot_menu' %}
Use the menu to navigate to and to select the `Recovery` option.
{%- when 'fastboot_boot' %}
```
fastboot boot {{ recovery_partition }}.img
```
{%- when 'fastboot_reboot' %}
Type the command:
```
fastboot reboot-recovery
```
{%- else %}
{%- endcase %}
