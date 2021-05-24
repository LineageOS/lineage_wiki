## Unlocking the bootloader

{% include alerts/specific/important_bootloader_not_unlockable.html %}

{% if device.before_recovery_install %}
{% capture path %}templates/device_specific/{{ device.before_recovery_install }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}

{% include templates/recovery_install_fastboot_ab.md %}
