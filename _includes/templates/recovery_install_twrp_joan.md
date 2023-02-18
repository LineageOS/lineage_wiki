{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

{% include snippets/before_recovery_install.md %}

## Unlocking the bootloader

{% include alerts/note.html content="The unlocking steps only need to be done once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader may erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Unlock your bootloader by following [this]({{ device.unlock_bootloader_guide }}) guide.

## Installing a custom recovery from TWRP using `dd`

{%- if device.maintainers != empty %}
1. Download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch | precision: 1 }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
1. If your device isn't already in recovery mode, on the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot recovery
```
    {% if device.download_boot %}
    You can also boot into recovery mode via a key combination:

    * {{ device.recovery_boot }}
        {% include templates/recovery_boot_lge.md %}
    {% endif %}
1. Once the device is in recovery mode, verify your PC finds it by typing:
```
adb devices
```
1. Place the recovery image file on the root of `/tmp`:
   * Using adb: `adb push <recovery_filename>.img /tmp/<recovery_filename>.img`
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
   * You can use any method you are comfortable with. `adb` is universal across all devices, and works both in Android and recovery mode, providing USB debugging is enabled.
1. Now, open a command prompt (on Windows) or terminal (on Linux or macOS) window. In there, type the following commands:
```
adb shell dd if=/tmp/<recovery_filename>.img of=/dev/block/bootdevice/by-name/recovery
```
1. Reboot into recovery.
    * From the same shell, type the following command:
```
adb reboot recovery
```
    {% if device.download_boot %}
    You can also boot into recovery mode via a key combination:

    * {{ device.recovery_boot }}
        {% include templates/recovery_boot_lge.md %}
    {% endif %}
{%- capture content %}
If your recovery does **not** show the LineageOS logo <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 24" style="height: 1rem; vertical-align: middle;">
          <path d="M40,12a4,4,0,0,0-3,1.33l-.23-.09A29.62,29.62,0,0,0,32,11.81h0a8,8,0,0,0-16,0l-.22,0a29.53,29.53,0,0,0-4.6,1.39l-.23.09a4,4,0,1,0,.93,1.78h0a27.62,27.62,0,0,1,4.29-1.29,8,8,0,0,0,15.57,0,27.55,27.55,0,0,1,4.29,1.28h0A4,4,0,1,0,40,12ZM8,18a2,2,0,1,1,2-2A2,2,0,0,1,8,18Zm16,0a6,6,0,1,1,6-6A6,6,0,0,1,24,18Zm16,0a2,2,0,1,1,2-2A2,2,0,0,1,40,18ZM27,12a3,3,0,1,1-3-3A3,3,0,0,1,27,12Z"></path>
        </svg>
   , you accidentally booted into the wrong recovery. Please start at the top of this section!
{%- endcapture %}
    {% include alerts/note.html content=content %}
