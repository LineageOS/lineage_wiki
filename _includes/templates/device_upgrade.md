{%- assign device = site.data.devices[page.device] %}
{%- assign path_prefix = "devices/" | append: device.codename %}
{%- assign device = site.data.devices[page.device] -%}
{%- if device.custom_recovery_codename %}
{%- assign custom_recovery_codename = device.custom_recovery_codename %}
{%- else %}
{%- assign custom_recovery_codename = device.codename %}
{%- endif %}

{% include alerts/important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

{% capture upgrade_only %}These instructions only apply to version upgrades. If you wish to downgrade to an earlier version of LineageOS, follow your [device's]({{ path_prefix | append: "/install" | relative_url }}) instructions for installing LineageOS the first time.{% endcapture %}
{% include alerts/warning.html content=upgrade_only %}

{%- if device.before_install.instructions == "needs_specific_android_fw" %}
{% unless device.before_install.ships_fw %}
{% capture path %}templates/device_specific/before_install_{{ device.before_install.instructions }}.md{% endcapture %}
{% include {{ path }} %}
{% endunless %}
{%- endif %}

{%- if device.architecture.userspace -%}
{%- assign userspace_architecture = device.architecture.userspace -%}
{%- else -%}
{%- assign userspace_architecture = device.architecture -%}
{%- endif -%}

## Manually upgrading LineageOS

{%- unless device.is_ab_device %}
{%- capture recovery_update %}
{%- if device.custom_recovery_link %}
1. Verify your device is using [this]({{ device.custom_recovery_link }}) recovery.
{%- elsif device.uses_twrp %}
1. Verify your device is using the latest [TWRP](https://dl.twrp.me/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `twrp-x.x.x-x-{{ custom_recovery_codename }}.img`.
{%- else %}
1. Verify your device is using the latest [Lineage Recovery](https://download.lineageos.org/{{ custom_recovery_codename }}). Simply download the latest recovery file, named something like `lineage-{{ device.current_branch }}-{{ site.time | date: "%Y%m%d" }}-recovery-{{ custom_recovery_codename }}.img`.
{%- endif %}
Follow your [device's installation guide]({{ path_prefix | append: "/install" | relative_url }}) to see how you can update your recovery image.
    {% include alerts/important.html content="These instructions may not work if you choose to use a different recovery!" %}
{%- endcapture %}
{%- endunless %}

{%- for version in device.versions %}
{%- if version < 17.1 %}
{%- capture adbRoot -%}
3. Additionally if you are on LineageOS 16.0 or below, open Settings, then "System", then "Developer Options", then select "Root Access Options", and finally "ADB Only". Now, run `adb root`
{%- endcapture -%}
{%- break %}
{%- endif %}
{%- endfor %}

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

{{ recovery_update }}
{%- if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ path_prefix | append: "/build" | relative_url }}) the package yourself.
{%- else %}
1. [Build]({{ path_prefix | append: "/build" | relative_url }}) a LineageOS install package.
{%- endif %}
2. If you are currently using (or now want to use) an application package add-on such as [Google Apps]({{ "gapps.html" | relative_url }}), you have the following options:
    - keep using them: Download the appropriate version [now]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture)
    - remove them: You can only do so by performing a factory reset, which will also remove all your data.
    - start using them: You can only do so by performing a factory reset, which will also remove all your data. Download the appropriate version [now]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture)
3. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
4. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
{{ adbRoot }}
{%- if device.format_on_upgrade %}
4. Reboot into recovery by running `adb reboot recovery`, or by performing the following:
    * {{ device.recovery_boot }}
5. Wipe your data partition (this is usually named "Wipe", or "Format")
    {% include alerts/warning.html content="Without this step your device will not boot on the new version!" %}
{%- if device.uses_twrp != true %}
6. Click `Advanced`, then `Enable ADB`.
{%- endif %}
{%- endif %}
4. Run `adb reboot sideload`.
    {% include alerts/important.html content="The device may reboot to a blank black screen, fear not, this is a known bug on some recoveries, proceed with the instructions." %}
5. Run `adb sideload /path/to/zip` (inserting the path to your LineageOS package).
    {% include alerts/specific/tip_adb_flash_success.html %}
{%- if device.is_ab_device and device.uses_twrp %}
6. _(Optionally)_: If you want to install any add-ons, run `adb reboot sideload` once more, then `adb sideload /path/to/zip` those packages in sequence.
{%- elsif device.is_ab_device %}
6. _(Optionally)_: If you want to install any add-ons, click `Advanced`, then `Reboot to Recovery`, then when your device reboots, click `Apply Update`, then `Apply from ADB`, then `adb sideload /path/to/zip` those packages in sequence.
{%- elsif device.uses_twrp %}
6. _(Optionally)_: If you want to install any add-ons, click `Advanced`, then `ADB Sideload`, then swipe to begin sideload, then `adb sideload /path/to/zip` those packages in sequence.
{%- else %}
6. _(Optionally)_: If you want to install any add-ons, click `Apply Update`, then `Apply from ADB`, then `adb sideload /path/to/zip` those packages in sequence.
{%- endif %}
    {% include alerts/note.html content="If you previously had any Google Apps add-on package installed on your device, you must install an updated package **before** the first boot of Android! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them." %}
{% if device.is_ab_device or device.uses_twrp != true %}
    {% include alerts/specific/note_signature_check.html %}
{%- endif %}

{% if device.current_branch >= 17.1 %}
{% if device.uses_twrp and device.is_ab_device != true %}
7. Once you have installed everything successfully, run `adb reboot`.
{% else %}
7. Once you have installed everything successfully, click the back arrow in the top left of the screen, then "Reboot system now".
{% endif %}
{% else %}
{% if device.uses_twrp and device.is_ab_device != true %}
7. _(Optionally)_: Root your device by installing [LineageOS' AddonSU](https://download.lineageos.org/extras), (use the `{{ userspace_architecture }}` package) or by using any other method you prefer.
8. Once you have installed everything successfully, run `adb reboot`.
{% else %}
9. _(Optionally)_: Root your device by installing [LineageOS' AddonSU](https://download.lineageos.org/extras), (use the `{{ userspace_architecture }}` package) or by using any other method you prefer.
10. Once you have installed everything successfully, click the back arrow in the top left of the screen, then "Reboot system now".
{% endif %}
{% endif %}

{%- if device.custom_recovery_link or device.uses_twrp %}
{% include alerts/specific/warning_recovery_app.html %}
{%- endif %}

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).
