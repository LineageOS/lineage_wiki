{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Temporarily booting a custom recovery using the Dirty COW exploit

{% if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{% else %}
{% if device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{% else %}
1. Download a custom recovery - you can download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{% endif %}
{% endif %}
2. Follow steps 12-14 from [this guide](https://android.gadgethacks.com/how-to/root-your-t-mobile-lg-v20-using-dirty-cow-0175329/) but instead of using the guide's TWRP image on step 14, use the file from above.