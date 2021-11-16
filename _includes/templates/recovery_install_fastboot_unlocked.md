{% if device.before_recovery_install %}
{% capture path %}templates/device_specific/before_recovery_install_{{ device.before_recovery_install }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}

{% include templates/recovery_install_fastboot_generic.md %}
