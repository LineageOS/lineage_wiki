{% assign device = site.data.devices[page.device] %}

{% include alerts/important.html content="Please read through the instructions at least once completely before actually following them to avoid any problems because you missed something!" %}

{% capture upgrade_only %}These instructions only apply to version upgrades. If you wish to downgrade to an earlier version of LineageOS, follow your [device's]({{ "devices/" | append: device.codename | append: "/install" | relative_url }}) instructions for installing LineageOS the first time.{% endcapture %}
{% include alerts/warning.html content=upgrade_only %}

{%- capture userspace_architecture -%}
{%- if device.architecture.userspace -%}
{{ device.architecture.userspace }}
{%- else -%}
{{ device.architecture }}
{%- endif -%}
{%- endcapture -%}

## Manually upgrading LineageOS

{%- unless device.is_ab_device %}
{%- capture recovery_update %}In some cases, a newer LineageOS version may not install due to an outdated recovery.
Follow your [device's installation guide]({{ "devices/" | append: device.codename | append: "/install" | relative_url }}) to see how you can update your recovery image.{% endcapture %}
{% include alerts/tip.html content=recovery_update %}
{%- endunless %}

{%- for version in device.versions %}
{%- if version < 17.1 %}
{%- capture devOptions -%}
Additionally, open Settings, then "System", then "Developer Options", then select "Root Access Options", and finally "ADB Only". Now, run `adb root`'
{%- endcapture -%}
{%- break %}
{%- endif %}
{%- endfor %}

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

{%- if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{%- else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{%- endif %}
    * Optionally, download additional application packages such as [Google Apps]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture).
2. Make sure your computer has working `adb`. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
3. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device. {{ devOptions }}
4. Run `adb reboot sideload`.
    {% include alerts/important.html content="The device may reboot to a blank black screen, fear not, this is a known bug on some recoveries, proceed with the instructions." %}
5. Run `adb sideload /path/to/zip` (inserting the path to your LineageOS package).
{%- if device.is_ab_device and device.uses_twrp %}
6. _(Optionally)_: If you want to install any additional add-ons, run `adb reboot sideload` once more, then `adb sideload /path/to/zip` those packages in sequence.
{%- elsif device.is_ab_device %}
6. _(Optionally)_: If you want to install any additional add-ons, click `Advanced`, then `Reboot to Recovery`, then when your device reboots, click `Apply Update`, then `Apply from ADB`, then `adb sideload /path/to/zip` those packages in sequence.
{%- elsif device.uses_twrp %}
6. _(Optionally)_: If you want to install any additional add-ons, click `Advanced`, then `ADB Sideload`, then swipe to begin sideload, then `adb sideload /path/to/zip` those packages in sequence.
{%- else %}
6. _(Optionally)_: If you want to install any additional add-ons, click `Apply Update`, then `Apply from ADB`, then `adb sideload /path/to/zip` those packages in sequence.
{%- endif %}
    {% include alerts/note.html content="If you previously had any Google Apps package installed on your device, you must install an updated package **before** the first boot of Android! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them." %}

{% if device.current_branch == 17.1 %}
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

{% include alerts/warning_recovery_app.html %}

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
