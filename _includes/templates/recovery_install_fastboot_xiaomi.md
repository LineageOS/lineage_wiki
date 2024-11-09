{%- assign device = site.data.devices[page.device] %}
{%- unless device.no_oem_unlock_switch %}
## Before unlocking the bootloader

{% include alerts/important.html content="This step only apply on Xiaomi devices **purchased with China ROM installed**. If you do not have such a device, you can safely skip this step." %}

Xiaomi has introduced new policies on unlocking bootloader for devices purchased with China ROM installed after November 8, 2023, attaining permission for bootloader unlocks require the use of [Chinese Xiaomi Community](https://www.xiaomi.cn), which is preinstalled as an app on Chinese devices.

An application has to be lodged with Xiaomi through the Chinese Xiaomi Community app, with the following requirements:
* Users must have passed human / ID verification
* Users must achieve Level 5 on the community.
* Users must take and pass a special test prior to applying.
* The user had not participated in a test in the past 168 hours (7 days).

Additional guidelines will be provided when you take the test. You are reminded that test dates and times are provided in the announcement of the test. Users **must** confirm their entrance within 5 minutes before the start of the test, and you **must** spend at minimum 10 minutes for the whole test, otherwise the test will be invalid.

Please note that once your bootloader unlock application has been accepted, you **must** unlock your device following the instructions in the next step within the validity period (336 hours, or 14 days). Each application is only valid for one single device, and cannot be exchanged with another China device.

If your application is declined repeatedly, your account may have been flagged by the system, especially if you were also declined for internal testing of HyperOS. You could only re-attempt the process until you have succeeded.

LineageOS is not responsible for auditing these tests, and we cannot guarantee whether you would be granted bootloader unlock permissions.

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device. They **require** a machine running Windows 7 or newer." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device! Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/important.html content="Xiaomi devices purchased with China ROM installed after November 8, 2023 **require** additional steps prior to unlocking." %}

1. Create a Mi account on [Xiaomi's website](https://global.account.xiaomi.com/pass/register). Beware that one account is only allowed to unlock one unique device every year.
2. Add a phone number to your Mi account.
3. Insert a SIM into your phone.
4. Enable developer options in `Settings` > `About Phone` by repeatedly tapping `MIUI Version`.
5. Link the device to your Mi account in `Settings` > `Additional settings` > `Developer options` > `Mi Unlock status`.
6. Download the [Mi Unlock app](https://en.miui.com/unlock/download_en.html) (Windows is required to run the app).
7. Ensure your device has appropriate drivers installed by running `driver_install.exe` (for 32-bit) `driver_install_64.exe` (for 64-bit) included with Mi Unlock. You have to ensure the driver was succesfully installed, otherwise Mi Unlock app may not detect your device.
8. Run the Mi Unlock app and follow the instructions provided by the app. It may tell you that you have to wait up to 30 days. If it does so, please wait the quoted amount of time before continuing to the next step! It is ideal to start this step at **midnight (GMT+8)**.
9. After device and Mi account are successfully verified, the bootloader should be unlocked.
10. Since the device resets completely, you will need to re-enable USB debugging to continue.

{% endunless %}

{% include snippets/before_recovery_install.md %}

{% include templates/recovery_install_fastboot_generic.md %}
