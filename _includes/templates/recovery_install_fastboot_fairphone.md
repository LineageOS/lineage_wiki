{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="Unlocking the bootloader only needs to be done once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

Follow the instructions at [Fairphone Support](https://support.fairphone.com/hc/en-us/articles/10492476238865) to unlock your bootloader.

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
