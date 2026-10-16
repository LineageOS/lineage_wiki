## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader may erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/important.html content="This device is unlocked by flashing a patched bootloader (`lk.img`). Do **not** request an unlock code from the OEM or attempt to unlock the bootloader through any other method." %}

{%- if device.maintainers != empty %}
1. Download `lk.img` from [here](https://download.lineageos.org/devices/{{ device.codename }}).
{%- else %}
1. [Build]({{ device | device_link: "build" | relative_url }}) a LineageOS installation package. `lk.img` will be available as part of it!
{%- endif %}
2. Connect the device to your PC via USB.
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
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!

5. Flash the patched bootloader to both slots by typing:
```
fastboot flash lk_a lk.img
fastboot flash lk_b lk.img
```
    {% include snippets/fastboot_path.md %}
6. Reboot to bootloader mode:
```
fastboot reboot bootloader
```
    The bootloader is now unlocked, no further unlocking steps are required.

{% include templates/device_specific/before_recovery_install_boot_stack.md %}
