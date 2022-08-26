{%- assign device = site.data.devices[page.device] -%}

{% include snippets/before_recovery_install.md %}

## Unlocking the bootloader

{% include alerts/note.html content="The unlocking steps only need to be done once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader may erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Unlock your bootloader by following [this]({{ device.unlock_bootloader_guide }}) guide.

{% include templates/recovery_install_fastboot_generic.md %}
