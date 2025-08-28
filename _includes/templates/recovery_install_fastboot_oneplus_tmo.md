{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Connect the device to your PC via USB.
2. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb -d reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
3. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!

4. Follow the instructions at [OnePlus Support](https://service.oneplus.com/pl/search/search-detail?id=op588) to unlock your bootloader.
5. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
