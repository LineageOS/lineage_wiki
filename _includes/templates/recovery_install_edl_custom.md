{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_twrp_codename %}
{% assign twrp_codename = device.custom_twrp_codename %}
{% else %}
{% assign twrp_codename = device.codename %}
{% endif %}

## Installing a custom recovery using `edl`

{% if device.custom_twrp_link %}
1. Download a custom recovery - you can download [TWRP]({{ device.custom_twrp_link }}).
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ twrp_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ twrp_codename }}.img`.
{% endif %}
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot edl
```
    {% if device.edl_boot %}
    You can also boot into edl mode via a key combination:

    * {{ device.edl_boot }}
    {% endif %}
4. Flash recovery onto your device by following [this]({{ device.install_recovery_guide }}) guide.
