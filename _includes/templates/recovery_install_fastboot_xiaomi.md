{% unless site.data.devices[page.device].no_oem_unlock_switch %}
## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Link the device to your Mi account and to a SIM (`Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`). This step is mandatory and will trigger a countdown, the waiting period before a device can be unlocked. The waiting period varies from 24 hours to 360 hours (message: `您的账号跟设备的绑定时间太短, 请 24 个小时后再解锁. Please unlock 24 hours later.`).
1. Download the Mi Unlock app, the link can be found at <http://en.miui.com/unlock/download_en.html>, the latest version is [3.3.827.31](http://miuirom.xiaomi.com/rom/u1106245679/3.3.827.31/miflash_unlock-en-3.3.827.31.zip) **Warning!** Windows is required to run the app, but it works in VirtualBox with USB2.0 activated 
1. Once the 360 hours waiting period is over, run the Mi Unlock app and follow the instructions provided by the app.
1. After device and Mi account are successfully verified, the bootloader should be unlocked.
1. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% include alerts/tip.html content="A Mi account is required to apply for permissions. You don't need to re-apply for permissions to unlock new devices,
but beware that one account is only allowed to unlock one unique device every 30 days." %}
{% include alerts/tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before proceeding with unlock." %}
{% endunless %}

{% include templates/recovery_install_fastboot_generic.md %}
{% if site.data.devices[page.device].no_oem_unlock_switch %}
{% include alerts/tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before installing a custom recovery." %}
{% endif %}
