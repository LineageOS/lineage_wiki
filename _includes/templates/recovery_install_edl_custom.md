{% if site.data.devices[page.device].custom_recovery_codename %}
{% assign custom_recovery_codename = site.data.devices[page.device].custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = site.data.devices[page.device].codename %}
{% endif %}

## Installing a custom recovery using `edl`

{% if site.data.devices[page.device].custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ site.data.devices[page.device].custom_recovery_link }}).
{% else %}
{% if device.uses_lineage_recovery %}
1. Download a custom recovery - you can download [Lineage Recovery](https://ftp.acc.umu.se/mirror/lineageos/recovery/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-x.yy-yyyymmdd-recovery$
{% else %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% endif %}
{% endif %}
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot edl
```
    {% if site.data.devices[page.device].edl_boot %}
    You can also boot into edl mode via a key combination:

    * {{ site.data.devices[page.device].edl_boot }}
    {% endif %}
4. Flash recovery onto your device by following [this]({{ site.data.devices[page.device].install_recovery_guide }}) guide.
