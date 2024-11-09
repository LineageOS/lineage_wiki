{%- assign device = site.data.devices[page.device] %}
{%- unless device.no_oem_unlock_switch %}
## Getting permission to unlock bootloader (Chinese users)

{% include alerts/important.html content="This step only apply on Chinese region Xiaomi devices **purchased with or updated to the China HyperOS Stock ROM**. If you do not have such a device, you can safely skip this step by clicking 'Next Step' below." %}
{% include alerts/warning.html content="The instructions provided on this page may change over time. Although concerted effort has been made to document the unlock process for the benefit of users, we do not guarantee the information on this page will be valid at your time of viewing, but are confirmed to be accurate as of Q1-2025. Please refer to official instructions found inside the Chinese Xiaomi Community app for any changes to the process." %}

Xiaomi has introduced new policies on unlocking bootloader for Chinese region devices purchased with, or updated to a China HyperOS Stock ROM released on or after November 8, 2023. The new policy requires attaining permission for bootloader unlocks through the use of [Chinese Xiaomi Community](https://www.xiaomi.cn), which is preinstalled as an app on Chinese region devices.

As of Q1-2025, the application **must** meet the following requirements:
- The account used is registered as a Chinese region account.
* The user had passed human / ID verification.
* The user had achieved Level 5 on the community.
* The user had taken and passed a special Android knowledge based test.
* The user had not participated in a test in the past 168 hours (7 days).

Additional instructions will be provided when you take the test. You are reminded that test dates and times are provided in the announcement of each test season. Users **must** confirm their entrance 5 minutes before the start of the test, and **must** spend at minimum 10 minutes for the whole test, otherwise the test will be invalid.

Please note that once you have been granted unlock access, you **must** unlock your device following instructions of the next step within the validity period (336 hours, or 14 days). Each application is only valid for a single device, and cannot be moved or transferred to any other device. If you are declined for any reason, you can re-attempt the process until you are accepted.

LineageOS is not responsible for or affiliated with Xiaomi, nor will you find support with filing applications/tests in our community. Please proceed from this step only once all Xiaomi required steps have been followed, and your device's bootloader is unlocked.

{% endunless %}

{% include templates/recovery_install_fastboot_xiaomi.md %}
