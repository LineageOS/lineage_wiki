{% if device.before_recovery_install %}
{%- capture instructions %}
{%- if device.before_recovery_install.instructions %}{{ device.before_recovery_install.instructions }}
{%- else %}{{ device.before_recovery_install }}{% endif %}
{%- endcapture %}
{% capture path %}templates/device_specific/before_recovery_install_{{ instructions }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}
