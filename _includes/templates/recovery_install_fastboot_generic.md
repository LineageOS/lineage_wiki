{% assign device = site.data.devices[page.device] -%}
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
{%- assign is_lineage_recovery = true %}
1. Download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch | precision: 1 }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- else %}
{%- assign is_lineage_recovery = true %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
2. Connect your device to your PC via USB if it isn't already.
3. If your device isn't already in fastboot mode, on the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
4. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
   If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!

   {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}
{% if device.needs_fastboot_boot %}
5. Temporarily boot recovery on your device (replace `<recovery_filename>` with the actual filename!):
```
fastboot boot <recovery_filename>.img
```
{% else %}
5. Flash recovery onto your device (replace `<recovery_filename>` with the actual filename!):
```
fastboot flash recovery <recovery_filename>.img
```
6. Now reboot into recovery to verify the installation.
    {%- if device.recovery_reboot %}
    * {% include snippets/recovery_reboot.md %}
    {%- else %}
    Do **not** reboot into the existing OS, since it will overwrite the recovery you just installed!
    * {{ device.recovery_boot }}

      {% include alerts/note.html content="If you can't power down the device, try long-pressing the key-combination (if any was used in the instructions above) until the device reboots and follow the instructions above" %}
    {%- endif %}
{%- if is_lineage_recovery == true %}
{%- capture content %}
If your recovery does **not** show the LineageOS logo <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 24" style="height: 1rem; vertical-align: middle;">
          <path d="M40,12a4,4,0,0,0-3,1.33l-.23-.09A29.62,29.62,0,0,0,32,11.81h0a8,8,0,0,0-16,0l-.22,0a29.53,29.53,0,0,0-4.6,1.39l-.23.09a4,4,0,1,0,.93,1.78h0a27.62,27.62,0,0,1,4.29-1.29,8,8,0,0,0,15.57,0,27.55,27.55,0,0,1,4.29,1.28h0A4,4,0,1,0,40,12ZM8,18a2,2,0,1,1,2-2A2,2,0,0,1,8,18Zm16,0a6,6,0,1,1,6-6A6,6,0,0,1,24,18Zm16,0a2,2,0,1,1,2-2A2,2,0,0,1,40,18ZM27,12a3,3,0,1,1-3-3A3,3,0,0,1,27,12Z"></path>
        </svg>
   , you accidentally booted into the wrong recovery. Please start at the top of this section!
{%- endcapture %}
    {% include alerts/note.html content=content %}
{%- endif %}
{% endif %}
