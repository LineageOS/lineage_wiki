{% unless site.data.devices[page.device].no_oem_unlock_switch %}
## Unlocking the bootloader

{% include warning.html content="The steps below are subject to change and have changed a lot over the past. If in doubt, follow instructions on Xiaomi website, unlocking program or device screen." %}
{% include note.html content="The steps below only need to be run once per device." %}
{% include warning.html content="Unlocking the bootloader might or might not erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent." %}

1. Downloads [Xiaomi's official "Mi Unlock" Windows program](http://en.miui.com/unlock/download_en.html).
2. Create a [Mi account](https://account.xiaomi.com/pass/register).
3. Run "Mi Unlock" and follow its instructions. This will entail the following:
4. Link the device to your Mi account in `Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`.
5. Log into your Mi account in "Mi Unlock" and confirm you want to unlock the device several times.
6. Connect device and computer over USB.
7. Enable "OEM unlocking" in `Settings` > `Additional settings` > `Developer options`.
8. Reboot device while holding the volume down button.
9. Select "Unlock" on the computer.
10. Be told in bad English to wait for 72 hours before trying again (from step 5).

{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before proceeding with unlock." %}
{% endunless %}

{% include templates/recovery_install_fastboot_generic.md %}
{% if site.data.devices[page.device].no_oem_unlock_switch %}
{% include tip.html content="It is highly recommended to have the latest official MIUI dev package installed on the device, before installing a custom recovery." %}
{% endif %}
