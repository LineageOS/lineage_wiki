{% include alerts/warning.html content="Make sure to download exact firmware for your model. You can discern your model from Settings > About phone > MIUI version (Eg: In MIUI version V13.0.6.0 SKHMIXM 'MI' represents your phone region, which is Global). You can also verify your Xiaomi phone at [official site](https://www.mi.com/global/verify)." %}

{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
1. Download the required firmware for your model.
{%- for el in device.before_install_device_variants %}
   - {{ el.device }} - [{{ el.firmware }}]({{ el.download_link }})
{%- endfor %}
{%- else %}
1. Download the latest firmware for your device from official website.
{%- endif %}
