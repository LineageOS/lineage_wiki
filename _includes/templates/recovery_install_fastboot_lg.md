{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Visit [LG's official unlocking website](http://developer.lge.com/resource/mobile/RetrieveBootloader.dev), where you'll be asked to login.
2. Follow the instructions and get your unlock file.
3. Connect your device to your PC via USB.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
5. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}
5. Now type the following command to unlock the bootloader:
```
fastboot flash unlock unlock.bin
```
    Where `unlock.bin` is the bootloader unlock file you received in the email.
7. Wait for the bootloader unlocking process to complete. Once finished, you can check if bootloader is successfully unlocked by typing:
```
fastboot getvar unlocked
```
    Verify that the response is `unlocked: yes`. In that case, you can now install third-party firmware.
8. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include alerts/tip.html content="It is highly recommended to have the latest official LG stock package installed on the device, before proceeding with unlock." %}

{% include templates/recovery_install_fastboot_generic.md %}