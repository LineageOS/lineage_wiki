{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

{% unless device.no_oem_unlock_switch %}
1. If not already enabled, enable Developer Options by pressing the "Build Number" option in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
    {% include alerts/note.html content="Some newer Motorola devices have a waiting period before you can enable `OEM Unlock` option in the developer options. It can sometimes take up to one week." %}
{% endunless %}
2. Power off your device.
3. Follow the instructions at [Motorola Support](http://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) to unlock your bootloader.
4. As the device was factory reset, you will need to re-enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}).

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
