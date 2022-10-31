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
{%- else %}
1. Download [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- endif %}
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
{% endif %}
