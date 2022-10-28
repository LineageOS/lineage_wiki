{% include alerts/warning.html content="Make sure to download exact firmware for your model. You can discern your model from Settings > About phone > MIUI version (Eg: In MIUI version V13.0.6.0 SKHMIXM 'MI' represents your phone region, which is Global). You can also verify your Xiaomi phone at [official site](https://www.mi.com/global/verify)." %}
{% include alerts/tip.html content="Some devices might have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot flash ...` you may have to try a different USB port (preferably a USB Type-A 2.0 one) or use a USB hub." %}

{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
1. Download the required firmware for your model.
{%- for el in device.before_install_device_variants %}
   - {{ el.device }} - [{{ el.firmware }}]({{ el.download_link }})
{%- endfor %}
{%- else %}
1. Download the latest firmware for your device from official [website](https://new.c.mi.com/global/miuidownload/index).
{%- endif %}
