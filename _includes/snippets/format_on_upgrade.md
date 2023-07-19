{% assign device = site.data.devices[page.device] %}

{% if device.recovery_partition_name %}
{% assign recovery_partition_name = device.recovery_partition_name %}
{% else %}
{% assign recovery_partition_name = "boot" %}
{% endif %}

{%- unless device.format_on_upgrade %}
{% include alerts/note.html content="Following these instructions will **not** wipe your data. It is, however, recommended to save important data before doing so, anyway!" %}
{%- endunless %}

{%- capture wiping_instructions %}
{%- if device.format_on_upgrade == "fbe" %}
8. If your device is not FBE encrypted, wipe your data partition (this is usually named "Wipe", or "Format").
    {% include alerts/note.html content="You can check if it's FBE encrypted by running the following command: `adb shell getprop ro.crypto.type`.
    If the output of this is `file`, then your device is FBE encrypted!" %}
{%- elsif device.format_on_upgrade == "fde" %}
8. If your device is FDE encrypted, you will need to wipe your data partition (this is usually named "Wipe", or "Format").
    {% include alerts/note.html content="This is due to the fact that Android 13 dropped support for FDE (Full Disk Encryption)." %}
    {% include alerts/note.html content="You can check if it's FDE encrypted by running the following command: `adb shell getprop ro.crypto.state`.
    If the output of this is `encrypted`, then your device is FDE encrypted!" %}
{%- elsif device.format_on_upgrade == "repartition" %}
8. If your device is has not yet been repartitioned, select "Advanced", then "Reboot to Bootloader".
    {% include alerts/note.html content="If you are uncertain if your device has been repartitioned, it likely has not!" %}
9. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `recovery.img`..
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
10. Now, use the volume buttons to select "Advanced", and then "Enable ADB"
11. If your device isn't already in fastboot mode, on the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
12. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable (preferably use a USB Type-A 2.0 one or a USB hub) and port!

    {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}

13. Flash a recovery on your device by typing:
```
fastboot flash {{ recovery_partition_name }} {{ recovery_partition_name }}.img
```
    {% include alerts/note.html content="Outdated fastboot releases dropped legacy A/B support, so it might attempt to flash to `boot__a` / `boot__b` rather than `boot_a` / `boot_b` if you try to flash `boot`. In this case, you must update `fastboot` to a release newer than or equal to `31.0.2`. Alternatively, you can manually specify which slot to flash to based on what slot fastboot failed to flash to. For example, if fastboot fails to flash to `boot__a`, you must flash to `boot_a`." %}
14. Now reboot into recovery to verify the installation.
    {%- if device.recovery_reboot %}
    * {% include snippets/recovery_reboot.md %}
    {%- else %}
    * {{ device.recovery_boot }}
    {%- endif %}
{%- assign is_lineage_recovery = true %}
{%- include snippets/recovery_logo_note.md %}
{%- if device.before_lineage_install %}
{% capture path %}templates/device_specific/before_lineage_install_{{ device.before_lineage_install }}.md{% endcapture %}
{% include {{ path }} %}
{%- endif %}
15. Wipe your data partition (this is usually named "Wipe", or "Format")
{%- elsif device.format_on_upgrade < device.current_branch %}
8. If your device is running LineageOS version older than {{ device.format_on_upgrade | precision: 1 }}, wipe your data partition (this is usually named "Wipe", or "Format").
{%- else %}
8. Wipe your data partition (this is usually named "Wipe", or "Format")
{%- endif %}
{%- endcapture %}
