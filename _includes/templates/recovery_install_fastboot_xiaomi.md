{%- assign device = site.data.devices[page.device] %}
{%- unless device.no_oem_unlock_switch %}
## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device. They **require** a machine running Windows 7 or newer." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device! Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/tip.html content="It is highly recommended to have the latest official MIUI stable package installed on the device, before proceeding with unlock." %}

1. Create a Mi account on [Xiaomi's website](https://global.account.xiaomi.com/pass/register). Beware that one account is only allowed to unlock one unique device every 30 days.
2. Add a phone number to your Mi account.
3. Insert a SIM into your phone.
4. Enable developer options in `Settings` > `About Phone` by repeatedly tapping `MIUI Version`.
5. Link the device to your Mi account in `Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`.
6. Download the [Mi Unlock app](https://en.miui.com/unlock/download_en.html) (Windows is required to run the app).
7. Run the Mi Unlock app and follow the instructions provided by the app. It may tell you that you have to wait up to 30 days. If it does so, please wait the quoted amount of time before continuing to the next step!
8. After device and Mi account are successfully verified, the bootloader should be unlocked.
9. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% endunless %}

{% include snippets/before_recovery_install.md %}

{% if device.is_ab_device and device.has_recovery_partition != true %}
{% include templates/recovery_install_fastboot_ab.md %}
{% else %}
{% include templates/recovery_install_fastboot_generic.md %}
{% endif %}

{% if device.no_oem_unlock_switch %}
{% include alerts/tip.html content="It is highly recommended to have the latest official MIUI stable package installed on the device, before installing a custom recovery." %}
{% endif %}
