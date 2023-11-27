{%- assign device = site.data.devices[page.device] %}
{%- if device.custom_recovery_codename %}
{%- assign custom_recovery_codename = device.custom_recovery_codename %}
{%- else %}
{%- assign custom_recovery_codename = device.codename %}
{%- endif %}

{% if device.migrated_to and device.migrated_to != "" %}
{% include templates/device_migrated_to.md %}
{% endif %}

{%- assign versions_count = device.versions|size -%}
{%- if versions_count < 2 %}
This device does not have more than one version so far, therefore we can't provide you with upgrade instructions!
{%- else %}

## Basic requirements

1. Read through the instructions at least once before actually following them, so as to avoid any problems due to any missed steps!
2. You actually want to upgrade your device to the newest version - if you wish to downgrade to an earlier version of LineageOS, follow your [device's]({{ device | device_link: "/install" | relative_url }}) instructions for installing LineageOS the first time.

{%- if device.quirks %}
{%- capture link %}{{ device | device_link | absolute_url | append: "#known+quirks" }}{% endcapture %}
3. You are aware of this device's [known quirks]({{ site.baseurl | append: link }})
{%- endif %}

{%- if device.before_install.instructions == "needs_specific_android_fw" %}
{% unless device.before_install.ships_fw %}
{% capture path %}templates/device_specific/before_install_{{ device.before_install.instructions }}.md{% endcapture %}
{% include {{ path }} %}
{% endunless %}
{%- endif %}

{%- if device.architecture.userspace %}
{% assign userspace_architecture = device.architecture.userspace %}
{% else %}
{% assign userspace_architecture = device.architecture %}
{%- endif %}

## Manually upgrading LineageOS

{%- include snippets/format_on_upgrade.md %}

{%- unless device.is_ab_device %}
{%- capture recovery_update %}
{%- if device.custom_recovery_link %}
1. Verify your device is using [this]({{ device.custom_recovery_link }}) recovery.
{%- elsif device.uses_twrp %}
1. Verify your device is using the latest [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- else %}
1. Verify your device is using the latest [Lineage Recovery](https://download.lineageos.org/devices/{{ custom_recovery_codename }}). Simply download the latest recovery file, named `{{ device.recovery_partition_name }}.img`.
{%- endif %}
Follow your [device's installation guide]({{ device | device_link: "/install" | relative_url }}) to see how you can update your recovery image.
    {% include alerts/important.html content="These instructions may not work if you choose to use a different recovery!" %}
{%- endcapture %}
{%- endunless %}

{%- for version in device.versions %}
{%- if version < 17.1 %}
{%- capture adbRoot -%}
3. Additionally if you are on LineageOS 16.0 or below, open Settings, then "System", then "Developer Options", then select "Root Access Options", and finally "ADB Only". Now, run `adb -d root`
{%- endcapture -%}
{%- break %}
{%- endif %}
{%- endfor %}

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

{{ recovery_update }}
{%- if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/devices/{{ device.codename }}) that you'd like to install or [build]({{ device | device_link: "/build" | relative_url }}) the package yourself.
{%- else %}
1. [Build]({{ device | device_link: "/build" | relative_url }}) a LineageOS install package.
{%- endif %}
2. If you are currently using (or now want to use) an application package add-on such as [Google Apps]({{ "gapps.html" | relative_url }}), you have the following options:
    - keep using them: Download the appropriate version [now]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture)
    - remove them: You can only do so by performing a factory reset, which will also remove all your data.
    - start using them: You can only do so by performing a factory reset, which will also remove all your data. Download the appropriate version [now]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture)
3. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
4. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
{{ adbRoot }}
{%- if device.format_on_upgrade %}
4. Reboot into recovery by running `adb -d reboot recovery`, or by performing the following:
    * {{ device.recovery_boot }}
{{ wiping_instructions }}
    {% include alerts/warning.html content="Without this step your device will not boot on the new version!" %}
{%- if device.uses_twrp != true %}
6. Click `Advanced`, then `Enable ADB`.
{%- endif %}
{%- endif %}
4. Run `adb -d reboot sideload`.
    {% include alerts/important.html content="The device may reboot to a blank black screen, fear not, this is a known bug on some recoveries, proceed with the instructions." %}
5. Run `adb -d sideload /path/to/zip` (inserting the path to your LineageOS package).
    {% include alerts/specific/tip_adb_flash_success.html %}
{%- if device.is_ab_device and device.uses_twrp %}
6. _(Optionally)_: If you want to install any add-ons, run `adb -d reboot sideload` once more, then `adb -d sideload /path/to/zip` those packages in sequence.
{%- elsif device.is_ab_device %}
6. _(Optionally)_: If you want to install any add-ons, click `Advanced`, then `Reboot to Recovery`, then when your device reboots, click `Apply Update`, then `Apply from ADB`, then `adb -d sideload /path/to/zip` those packages in sequence.
{%- elsif device.uses_twrp %}
6. _(Optionally)_: If you want to install any add-ons, click `Advanced`, then `ADB Sideload`, then swipe to begin sideload, then `adb -d sideload /path/to/zip` those packages in sequence.
{%- else %}
6. _(Optionally)_: If you want to install any add-ons, click `Apply Update`, then `Apply from ADB`, then `adb -d sideload /path/to/zip` those packages in sequence.
{%- endif %}
    {% include alerts/note.html content="If you previously had any Google Apps add-on package installed on your device, you must install an updated package **before** the first boot of Android! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them." %}
{% if device.is_ab_device or device.uses_twrp != true %}
    {% include alerts/specific/note_signature_check.html %}
{%- endif %}

{% if device.uses_twrp and device.is_ab_device != true %}
7. Once you have installed everything successfully, run `adb -d reboot`.
{% else %}
7. Once you have installed everything successfully, click the back arrow in the top left of the screen, then "Reboot system now".
{% endif %}

{%- if device.custom_recovery_link or device.uses_twrp %}
{% include alerts/specific/warning_recovery_app.html %}
{%- endif %}

## Get assistance

After you've double checked that you followed the steps precisely, didn't skip any and still have questions or got stuck, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).

{% endif %}
