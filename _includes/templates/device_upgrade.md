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

The updater app does not support upgrades from one version of LineageOS to another, and will block installation to any update for a different version. Upgrading manually requires similar steps to installing LineageOS for the first time.

{% if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
    * Optionally, download additional application packages such as [Google Apps]({{ "gapps.html" | relative_url }}) (use the `{{ userspace_architecture }}` architecture).
{% if device.is_ab_device %}
2. If your device isn't already booted into recovery, use `fastboot` to temporarily boot a custom recovery following the steps above.
{% else %}
2. If your device isn't already booted into recovery, do so:
    * {{ device.recovery_boot }}
{% endif %}
3. _(Optional, but recommended)_: Tap the **Backup** button to create a backup.
{% if device.format_on_upgrade %}
4. Go back to return to main menu, then tap **Wipe**.
5. Now tap **Format Data** and continue with the formatting process. This will remove encryption as well as delete all files stored on the internal storage.
{% endif %}
6. Sideload the LineageOS `.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload.
    * On the host machine, sideload the package using: `adb sideload filename.zip`
{% if device.is_ab_device %}
7. _(Optional)_: Once more, use `fastboot` to temporarily boot a custom recovery following the steps outlined above and install any additional packages by choosing "Apply Update", then "Apply from ADB", and then sideloading the packages like you did above. The reboot is necessary on devices with A/B (seamless) system updates.
{% else %}
7. _(Optional)_: Install any additional packages using the same method.
{% endif %}
    {% include alerts/note.html content="If you previously had any Google Apps package installed on your device, you must follow this step **before** the first boot into Android! If you did not have Google Apps installed, you must wipe the **Data** partition (or perform a factory reset) to install them now." %}
8. _(Optional)_: Root the device by installing the [LineageOS SU Addon](https://download.lineageos.org/extras) (use the `{{ userspace_architecture }}` package) or using any other method you prefer.
{% if device.is_ab_device %}
9. Once installation has finished, return to the main menu, tap **Reboot**.
{% else %}
9. Once installation has finished, return to the main menu, tap **Reboot**, and then **System**.
{% endif %}

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
