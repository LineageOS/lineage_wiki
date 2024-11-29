{% assign device = site.data.devices[page.device] %}
{% assign current_branch = device.current_branch %}


<script src="{{ site.baseurl }}/assets/js/pagination.js{{ cacheBust }}"></script>

<div id="paginated-content" markdown="1">

{% if device.migrated_to and device.migrated_to != "" %}
{% include templates/device_migrated_to.md %}
{% endif %}

{% capture install_content -%}
The provided instructions are for LineageOS {{ current_branch }}. These will only work if you follow every section and step precisely. <br/>
Do **not** continue after something fails!
{%- endcapture %}

{% include alerts/warning.html content=install_content %}

## Basic requirements

1. Read through the instructions at least once before actually following them, so as to avoid any problems due to any missed steps!
2. Make sure your computer has `adb`{% unless device.install_method == 'heimdall' or device.install_method == 'dd' %} and `fastboot`{% endunless %}. Setup instructions can be found [here]({{ "adb_fastboot_guide.html" | relative_url }}).
3. Enable [USB debugging]({{ "adb_fastboot_guide.html#setting-up-adb" | relative_url }}) on your device.
{%- if device.models %}
4. Make sure that your model number is one of the following (exact match required!):
{%- for model in device.models %}
* {{ model }}
{%- endfor %}
{%- endif %}
5. Boot your device with the stock OS at least once and check every functionality.
	{%- if device.type == "phone" %}
	{%- unless device.quirks contains "ims" %}
	- **Important**: Make sure that you can send and receive SMS and place and receive calls (also via WiFi and LTE, if available), otherwise it won't work on LineageOS either! Some devices require that VoLTE/VoWiFi be utilized once on stock OS to provision IMS (IP Multimedia Subsystem).
	{%- endunless %}
	{%- endif %}
5. If you haven't done so already, back up all your personal data from your device. Installing LineageOS will require you to delete all data in a later step.

6. LineageOS is provided as-is with no warranty. While we attempt to verify [everything works](https://github.com/LineageOS/charter/blob/main/device-support-requirements.md) you are installing this at your own risk!

{%- if device.before_install and device.before_install.instructions != "needs_specific_android_fw" %}
{% capture path %}templates/device_specific/before_install_{{ device.before_install.instructions }}.md{% endcapture %}
{% include {{ path }} %}
{%- endif %}

{% if device.required_bootloader %}
## Special requirements

{%- capture bootloader %}
Your device must be on bootloader version {% for el in device.required_bootloader %} {% if forloop.last %} `{{ el }}` {% else %} `{{ el }}` / {% endif %} {% endfor %}, otherwise the instructions found in this page will not work.
The current bootloader version can be checked by running the command `getprop ro.bootloader` in a terminal app or an `adb -d shell` from a command prompt (on Windows) or terminal (on Linux or macOS) window.
{% endcapture %}
{% include alerts/warning.html content=bootloader %}
{%- endif %}

{%- if device.before_install.instructions == "needs_specific_android_fw"}
## Checking the correct firmware
{% comment %}
This section deals with firmware requirements. There is two options. Most of the time a certain android version is required, the other option is that a certain firmware version is required. For this the
{% endcomment %}

Installation on your device requires a specific [firmware]({{ "glossary/#firmware" | absolute_url }}){: .glossary} version to be installed before you continue.

{%- if device.before_install.version %}
- LineageOS builds for this device require an **Android {{ device.before_install.version }}** version of the [stock OS]({{ "glossary/#stock-rom" | absolute_url }}){: .glossary} to be installed prior to following the installation guide
- The current Android version can usually be found in the Settings/About Phone section. 
- If the vendor provided multiple updates for that Android version, e.g. security updates, make sure you are on the latest!
- Please ensure that you are checking the Android version, and not the vendor OS version
- **Important:** If your current Android version is newer or older than the required version, please upgrade or downgrade to the required version before proceeding (guides can be found on the internet!).
