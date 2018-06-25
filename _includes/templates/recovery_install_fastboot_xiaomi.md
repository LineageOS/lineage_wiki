{% unless site.data.devices[page.device].no_oem_unlock_switch %}
## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Visit [Xiaomi's official unlocking website](http://en.miui.com/unlock/) and apply for unlocking permissions.
2. Wait until you get the approval, which may take some days.
3. At the same time, link the device to your Mi account in `Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`. This step is mandatory and will trigger a countdown of 360 hours, the waiting period before a device can be unlocked.
4. Once you get the approval, visit the website again and you will be redirected to the Mi Unlock app download page.
5. Download the Mi Unlock app (Windows is required to run the app).
6. Once the 360 hours waiting period is over, run the Mi Unlock app and follow the instructions provided by the app.
7. After device and Mi account are successfully verified, the bootloader should be unlocked.
8. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include tip.html content="A Mi account is required to apply for permissions. You don't need to re-apply for permissions to unlock new devices,
but beware that one account is only allowed to unlock one unique device every 30 days." %}
{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before proceeding with unlock." %}
{% endunless %}

{% include templates/recovery_install_fastboot_generic.md %}
{% if site.data.devices[page.device].no_oem_unlock_switch %}
{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before installing a custom recovery." %}
{% endif %}
