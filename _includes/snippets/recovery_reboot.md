{%- case device.recovery_reboot %}
{%- when 'fastboot_menu' %}
Use the menu to navigate to and to select the `Recovery` option.
    {% include alerts/note.html content="Please most that on most devices you'll need to use the <kbd>Volume Buttons</kbd> to cycle onscreen options and the <kbd>Power Button</kbd> to select (Mobile), or the <kbd>Side Button</kbd> (Android TV)." %}
{%- when 'fastboot_boot' %}
```
fastboot boot {{ device.recovery_partition_name }}.img
```
{%- when 'fastboot_reboot' %}
Type the command:
```
fastboot reboot recovery
```
{%- else %}
{%- endcase %}
