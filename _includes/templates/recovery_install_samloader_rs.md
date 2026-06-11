{%- assign device = site.data.devices[page.device] -%}
{% if device.custom_recovery_codename %}
{% assign custom_recovery_codename = device.custom_recovery_codename %}
{% else %}
{% assign custom_recovery_codename = device.codename %}
{% endif %}

{% include snippets/before_recovery_install.md %}

{% unless device.before_recovery_install == "samsung_qcom" %}
## Preparing for installation

Samsung devices come with a unique boot mode called "Download mode", which is very similar to "Fastboot mode" on some devices with unlocked bootloaders.
samloader-rs is a cross-platform, open-source tool for interfacing with Download mode on Samsung devices.
The preferred method of installing a custom recovery is through Download Mode{% unless custom_root_instructions %} -- rooting the stock firmware is neither necessary nor required{% endunless %}.

{% unless device.no_oem_unlock_switch %}
1. Enable Developer Options by pressing the "Build Number" option in the "Settings" app within the "About" menu
 * From within the Developer options menu, enable OEM unlock.
{% endunless %}
2. Download and extract the appropriate version of the samloader-rs for your machine's OS from [here](https://github.com/topjohnwu/samloader-rs/releases/latest)
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the on screen instructions correlate to "Continue", and insert the USB cable into the device.
4. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
samloader print-pit
```
5. If the device reboots that indicates that samloader-rs is working properly. If it does not, please refollow these instructions to verify steps weren't missed, try a different USB cable, and a different USB port.

{% if custom_downgrade_instructions %}
{{ custom_downgrade_instructions }}
{% endif %}

{% if custom_root_instructions %}
{{ custom_root_instructions }}
{% endif %}
{% endunless %}

{%- capture install_content %}
{%- if device.custom_recovery_link %}
{%- assign is_lineage_recovery = device.custom_lineage_recovery %}
1. Download a custom recovery - you can download one [here]({{ device.custom_recovery_link }}). Simply download the recovery file and rename it to `{{ device.recovery_partition_name }}.img`.
{%- elsif device.uses_twrp %}
1. Download a custom recovery - you can download [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img` and rename it to `{{ device.recovery_partition_name }}.img`.
    {% include alerts/tip.html content="Ensure you download the `.img` file and not the `.tar` or `.tar.md5` versions." %}
{%- elsif device.maintainers != empty %}
{%- assign is_lineage_recovery = true %}
1. Download [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ device.recovery_partition_name }}.img`.
{%- else %}
{%- assign is_lineage_recovery = true %}
1. [Build]({{ device | device_link: "build" | relative_url }}) a LineageOS installation package. The recovery will be built as part of it!
{%- endif %}
    {% include alerts/important.html content="Other recoveries may not work for installation or updates. We strongly recommend to use the one linked above!" %}
2. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
    * Now, click the button that the on screen instructions correlate to "Continue", and insert the USB cable into the device.
3. On your machine, open a Command Prompt or PowerShell (Windows) window, or Terminal (Linux or macOS) window, and type:
```
samloader flash --partition {{ device.recovery_partition_name | upcase }} {{ device.recovery_partition_name }}.img --no-reboot
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly. If the file is wrapped in a zip or tar file, extract the file first, because samloader-rs is not going to do it for you." %}
4. A transfer bar will appear on the device showing the recovery image being flashed.
    {% include alerts/note.html content="The device will continue to display `Downloading... Do not turn off target!!` even after the process is complete." %}
5. Manually reboot into recovery, this may require pulling the device's battery out and putting it back in, or if you have a non-removable battery, press the Volume Down + Power buttons for 8~10 seconds until the screen turns black & release the buttons *immediately* when it does, then boot to recovery:
    * {{ device.recovery_boot }}
    {% include alerts/note.html content="Be sure to reboot into recovery immediately after installing the custom recovery. If you don't the stock ROM will overwrite the custom recovery with the stock recovery, and you'll need to flash it again." %}
{%- include snippets/recovery_logo_note.md %}
{%- endcapture %}

{%- if is_lineage_recovery %}
## Installing Lineage Recovery using `samloader-rs`
{%- else %}
## Installing a custom recovery using `samloader-rs`
{%- endif %}
{{ install_content }}
