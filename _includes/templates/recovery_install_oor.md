{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Rooting your device

{% include alerts/important.html content="The device must be rooted before proceeding any further." %}

{% case device.root_method[0] %}
{% when 'custom' %}
1. Root your device by following [this]({{ device.root_method[1] }}) guide.
{% when 'kingroot' %}
1. Download KingRoot from [here](https://kingroot.net/).
   1. Install and run the apk to achieve root. Ensure you have a working Internet connection.
{% when 'towelroot' %}
1. Download TowelRoot from [here](https://towelroot.com/).
   1. Click the large lambda symbol to download the apk.
   2. Install and run the apk to achieve root.
{% endcase %}

{% include snippets/before_recovery_install.md %}

{%- capture install_content %}
{%- if device.custom_recovery_link %}
{%- assign is_lineage_recovery = device.custom_lineage_recovery %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- elsif device.maintainers != empty %}
{%- assign is_lineage_recovery = true %}
1. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ device.recovery_partition_name }}.img`.
{%- else %}
1. [Build]({{ device | device_link: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}

## Patching the recovery image using the out-of-range utility

1. Download the newest version of the out-of-range for your OS and architecture [here](https://github.com/jb881122/out-of-range/releases/latest).
2. Extract the `.zip` file downloaded above.
3. Open a Terminal in the folder the `oor` utility is extracted.
4. Run the following commands:
```
adb -d shell su -c dd if=/dev/block/platform/msm_sdcc.1/by-name/aboot of=/data/local/tmp/aboot.img
adb -d pull /data/local/tmp/aboot.img
./oor -p ./aboot.img recovery.img recovery.oor.img
adb -d push recovery.oor.img /data/local/tmp/recovery.oor.img`
```
NOTE: BL version
6. Now, run the following command to flash the recovery image on your device:
```
adb -d shell su -c dd if=/data/local/tmp/recovery.oor.img of={{ device.recovery_partition }}
```
7. Pending the above succeeded, reboot into recovery by running the following command:
```
adb -d reboot recovery
```
{%- endcapture %}

{%- if is_lineage_recovery %}
## Installing Lineage Recovery using `dd`
{%- else %}
## Installing a custom recovery using `dd`
{%- endif %}
{{ install_content }}
