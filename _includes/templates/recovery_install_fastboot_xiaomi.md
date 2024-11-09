{%- assign device = site.data.devices[page.device] %}
{%- unless device.no_oem_unlock_switch %}
## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device. They **require** a machine running Windows 7 or newer." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device! Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Create a Mi account on [Xiaomi's website](https://global.account.xiaomi.com/pass/register). Beware that one account is only allowed to unlock one unique device every 30 days.
2. Add a phone number to your Mi account.
3. Insert a SIM into your phone.
4. Enable developer options in `Settings` > `About Phone` by repeatedly tapping `MIUI Version`.
5. Enable OEM unlocking `Settings` > `Additional settings` > `Developer options` > `OEM unlocking`, then restart your phone.
6. Enable USB debugging in `Settings` > `Additional settings` > `Developer options` > `USB debugging`.
7. Turn off wifi and instead turn on mobile data.
8. Link the device to your Mi account in `Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`.
9. Download the [Mi Unlock app](https://en.miui.com/unlock/download_en.html) (Windows is required to run the app). If you have a problem with this version of app, try to use latest version from [Mi unlock app - latest version (unofficial link)](https://miuirom.org/updates/mi-flash-unlock). The problem with official link is the latest version is not always available there.
10. Connect phone to computer via USB and boot phone to `fastboot` mode, when your phone is powered off hold button volume down and power button. This step is required to properly install Mi USB driver.
11. Run `MiUsbDriver.exe` to install USB driver on your windows computer. File is included in zip archive next to `miflash_unlock.exe`. You have to see message that driver was succesfully installed, otherwise Mi Unlock app may not detect your device.
12. Run the Mi Unlock app and follow the instructions provided by the app. It may tell you that you have to wait up to 30 days. If it does so, please wait the quoted amount of time before continuing to the next step! If you have problem to unlock your device try to follow this [guide](https://miuirom.org/updates/xiaomi-bootloader) there are self explanation pictures step by step.
13. After device and Mi account are successfully verified, the bootloader should be unlocked.
14. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% endunless %}

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
