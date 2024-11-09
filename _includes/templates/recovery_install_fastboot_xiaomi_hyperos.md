{%- assign device = site.data.devices[page.device] %}
{%- unless device.no_oem_unlock_switch %}
## Getting permission to unlock bootloader (Chinese users)

{% include alerts/important.html content="This step only apply on Chinese Xiaomi devices **purchased with / updated to China ROM**. If you do not have such a device, you can safely skip this step." %}

Xiaomi has introduced new policies on unlocking bootloader for Chinese devices purchased with China ROM installed, or updated to version released after November 8, 2023, attaining permission for bootloader unlocks require the use of [Chinese Xiaomi Community](https://www.xiaomi.cn), which is preinstalled as an app on Chinese devices.

An application has to be lodged with Xiaomi through the Chinese Xiaomi Community app, with the following requirements:
* Users must have passed human / ID verification
* Users must achieve Level 5 on the community.
* Users must take and pass a special test prior to applying.
* The user had not participated in a test in the past 168 hours (7 days).

Additional instructions will be provided when you take the test. You are reminded that test dates and times are provided in the announcement of each test season. Users **must** confirm their entrance within 5 minutes before the start of the test, and **must** spend at minimum 10 minutes for the whole test, otherwise the test will be invalid.

Please note that once you have been granted unlock access, you **must** unlock your device following instructions of the next step within the validity period (336 hours, or 14 days). Each application is only valid for one single device, and cannot be exchanged with another China device. If you have been declined, you could only re-attempt the process until you have been accepted.

LineageOS is not responsible for auditing these tests, and we cannot guarantee whether you would be granted bootloader unlock permissions.

{% endunless %}

{% include snippets/recovery_install_fastboot_xiaomi.md %}
