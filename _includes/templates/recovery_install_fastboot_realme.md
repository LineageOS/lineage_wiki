{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/specific/important_bootloader_not_unlockable.html %}

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
