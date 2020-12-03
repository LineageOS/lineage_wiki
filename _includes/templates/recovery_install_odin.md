{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

## Important Information

{% include alerts/note.html content="The following instructions **require** a machine running Windows 7 or newer." %}

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
Odin is a Samsung-made tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through Download Mode{% unless custom_root_instructions %} -- rooting the stock firmware is neither necessary nor required{% endunless %}.

{% if custom_downgrade_instructions %}
{{ custom_downgrade_instructions }}
{% endif %}

{% if custom_root_instructions %}
{{ custom_root_instructions }}
{% endif %}

## Installing a custom recovery using `Odin`

{% include alerts/note.html content="If this device's install instructions already had you download Odin/Enable OEM Unlocking earlier in the installation process, you can skip steps 1, 3, 5, 6, and 7 below." %}

{% unless device.no_oem_unlock_switch %}
1. Enable Developer Options by pressing the "Build Number" option 10 times, in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
{% endunless %}
{% if device.custom_recovery_link %}
2. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}).
{% else %}
2. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.tar`.
    {% include alerts/tip.html content="Ensure you download the `.tar` or the `.tar.md5` file and not the `.img` version." %}
{% endif %}
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the onscren instructions coorelate to "Continue", and insert the USB cable into the device.
4. Download and install the necessary drivers.
    * Download the newest Samsung drivers from [here](https://developer.samsung.com/mobile/android-usb-driver.html). You will need to create a Samsung account and login to download them.
    * Install `SAMSUNG_USB_Driver_for_Mobile_Phones.exe`.
5. Download [this](https://androidfilehost.com/?fid=4349826312261712202) version of Odin.
6. Extract "Odin_3.13.1.zip".
7. Run `Odin3 v3.13.1` found in the newly  extracted "Odin_3.13.1" folder.
8. Check in the top left of the Odin window that you see a valid device, it will show up as something like `COM0`.
    {% include alerts/tip.html content="The `COM` port, or the number succeeding `COM`, may be any valid number." %}
9. In the left side of the Odin window, you will see an "Options" tab, click it, and then un-check the "Auto Reboot" option.
10. Check the box labeled next to the button labeled "AP", and then click the "AP" button.
    * In the menu that pops up, select the newly downloaded custom recovery `.tar` or `.tar.md5`.
    {% include alerts/tip.html content="The filename may very depending on your device, and the version of your custom recovery." %}
11. A blue transfer bar will appear on the device showing the recovery image being flashed.
    {% include alerts/note.html content="The device will continue to display `Downloading... Do not turn off target!!` even after the process is complete. When the status message in the top left of the devices's display reports that the process is complete, you may proceed." %}
12. Unplug the USB cable from your device.
13. Manually reboot into recovery, this may require pulling the device's battery out and putting it back in, or if you have a non-removable battery, press the Volume Down + Power buttons for 8~10 seconds until the screen turns black & release the buttons *immediately* when it does, then boot to recovery:
    * {{ device.recovery_boot }}
    {% include alerts/note.html content="Be sure to reboot into recovery immediately after installing the custom recovery. If you don't the custom recovery will be overwritten on boot." %}
