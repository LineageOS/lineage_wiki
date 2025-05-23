{%- assign device = site.data.devices[page.device] -%}
{%- assign release_year = device.release | split: '-' | first | to_integer -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% capture content -%}
Unlocking the bootloader will erase all data on your device!
{% if release_year < 2017 %}
This also includes your DRM keys, which are stored in the Trim Area partition (also called TA).
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed.
If you wish to backup the TA partition first, you can find tutorials related to your device on the internet."
{%- endif -%}
{%- endcapture %}
{% include alerts/warning.html content=content %}

{%- if device.install_variant and device.install_variant contains "sony_unlock_contacts" %}
1. Open the `Contacts` app.
2. Click on the menu button in the top right.
3. Click on `Settings`.
4. Long press (for about 5 seconds) somewhere in the empty space just above navigation bar, then release your finger. A button named `Enter service code` will then appear in the same area (this may take a few attempts).
5. Click on `Enter service code`. A dialer will appear.
{%- endif %}
1. On the device, dial `*#*#7378423#*#*` (`*#*#SERVICE#*#*`) to launch the service menu.
2. Go to `service info` > `configuration` and check `rooting status` - you can only continue if it says `Bootloader unlock allowed: Yes`.
3. Go to `System Settings` > `About Phone` and record the first IMEI number, which is necessary to get an unlock code from Sony in a later step.
{%- unless device.no_oem_unlock_switch %}
4. Enable OEM unlock in the Developer options under device Settings, if present.
{%- endunless %}
5. Connect the device to your PC via USB.
6. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb -d reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
7. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
8. Follow the instructions on [Sony's official unlocking website](https://developer.sony.com/open-source/aosp-on-xperia-open-devices/get-started/unlock-bootloader/) to generate an unlock code for your bootloader.
9. Use your code to unlock the bootloader of your device:
```
fastboot oem unlock <your_unlock_code>
```
10. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% if device.install_variant and device.install_variant contains "sony_init_fota" %}

{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Installing a custom recovery using `fastboot`

{%- if device.custom_recovery_link %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- elsif device.maintainers != empty %}
1. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ device.recovery_partition_name }}.img`.
{%- else %}
1. [Build]({{ device | device_link: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
2. Connect your device to your PC via USB.
3. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb -d reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Temporarily flash TWRP to `boot`:
```
fastboot flash boot twrp-x.x.x-x-{{ custom_recovery_codename }}.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly. Remember to adjust the filename in the following commands as well." %}
6. Reboot to the TWRP recovery:
```
fastboot reboot
```
7. Push the TWRP image to your device:
```
adb -d push twrp-x.x.x-x-{{ custom_recovery_codename }}.img /sdcard
```
8. Enter shell on the device:
```
adb -d shell
```
9. Flash TWRP to `recovery` permanently:
```
dd if=/sdcard/twrp-x.x.x-x-{{ custom_recovery_codename }}.img of=/dev/block/platform/msm_sdcc.1/by-name/FOTAKernel
```
10. Exit the adb -d shell:
```
exit
```
{% else %}

{% include templates/recovery_install_fastboot_generic.md %}

{% endif %}
