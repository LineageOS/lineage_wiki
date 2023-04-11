{%- assign device = site.data.devices[page.device] -%}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

{% if device.install_variant and device.install_variant contains "lenovo_unlock_url" %}
1. Visit [Lenovo's ZUI official unlocking website](https://www.zui.com/iunlock), where you'll be asked to fill in some device and contact information.
2. Follow the instructions and get your unlock file.
{%- unless device.no_oem_unlock_switch %}
3. Enable OEM unlock in the Developer options under device Settings, if present.
{%- endunless %}
{% else %}
{% unless device.no_oem_unlock_switch %}
4. Enable OEM unlock in the Developer options under device Settings, if present.
5. Accept the terms that you understand that you're voiding your warranty by choosing to unlock your bootloader.
6. Login with your Lenovo account (if you already have one) or create a new one.
7. A 14 days countdown timer will start. This is specific per device.
8. After the waiting period, go back to OEM unlocking so that the Lenovo servers can toggle the bootloader unlock switch.
{%- endunless %}
{% endif %}
9. Connect the device to your PC via USB.
10. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
11. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
  If you don't get any output or an error:
   * on Windows: make sure the device appears in the device manager without a triangle. Try other drivers until the command above works!
   * on Linux or macOS: If you see `no permissions fastboot` try running `fastboot` as root. When the output is empty, check your USB cable and port!
12. Now type the following command to unlock the bootloader:

{% if device.install_variant and device.install_variant contains "lenovo_unlock_url" %}
    ```
    fastboot flash unlock sn.img
    ```
    Where `sn.img` is the bootloader unlock file you received in the email.
13. Next, use your second unlock command
{% if device.custom_unlock_cmd %}
    ```
{{ device.custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}
    {% include alerts/note.html content="At this point the device may display on-screen prompts which will require interaction to continue the process of unlocking the bootloader. Please take whatever actions the device asks you to to proceed." %}

14. Wait for the bootloader unlocking process to complete. Once finished, you can check if bootloader is successfully unlocked by typing:
```
fastboot getvar unlocked
```
    Verify that the response is `unlocked: yes`. In that case, you can now install third-party firmware.
{% else %}

{% if device.custom_unlock_cmd %}
    ```
{{ device.custom_unlock_cmd }}
    ```
{% else %}
    ```
fastboot oem unlock
    ```
{% endif %}
    {% include alerts/note.html content="At this point the device may display on-screen prompts which will require interaction to continue the process of unlocking the bootloader. Please take whatever actions the device asks you to to proceed." %}
{% endif %}

15. If the device doesn't automatically reboot, reboot it. It should now be unlocked.
16. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% if device.before_recovery_install %}
{% capture path %}templates/device_specific/before_recovery_install_{{ device.before_recovery_install }}.md{% endcapture %}
{% include {{ path }} %}
{% endif %}

{% include templates/recovery_install_fastboot_generic.md %}
