{% unless site.data.devices[page.device].no_oem_unlock_switch %}
## Unlocking the bootloader

{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}
{% include warning.html content="To unlock this device, you will need a specific OS (Windows). 
Also there are some users with bad experiences: Miui Unlock Tool is not working right now, due a «Network Error»
For more info, see: http://en.miui.com/thread-651257-1-1.html" %}

1. Visit [Xiaomi's official unlocking website](http://en.miui.com/unlock/).
2. Apply for unlocking permissions.
3. Download the Mi Unlock app.
4. Wait patiently until you get the approval, which may take some days.
5. Once you get the approval, run the Mi Unlock app and follow the instructions provided by the app.
6. After device and Mi account are sucessfuly verified, the bootloader should be unlocked.
7. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include tip.html content="A Mi account is required to apply for permissions. You don't need to re-apply for permissions to unlock new devices,
but beware that one account is only allowed to unlock one unique device every 30 days." %}
{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before proceeding with unlock." %}
{% endunless %}

{% include templates/recovery_install_fastboot_generic.md %}
{% if site.data.devices[page.device].no_oem_unlock_switch %}
{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before installing a custom recovery." %}
{% endif %}
