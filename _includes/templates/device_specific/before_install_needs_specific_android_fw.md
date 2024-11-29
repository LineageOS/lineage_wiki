## Checking the correct firmware
{% comment %}
This section deals with firmware requirements. There is two options. Most of the time a certain android version is required. If that is the case basic information about this will be shown. The other option is that a certain firmware version is required. For this a guide on how to upgrade/downgrade is linked and a table of the correct firmware versions is shown. 
{% endcomment %}

Installation on your device requires a specific [firmware]({{ "glossary/#firmware" | absolute_url }}){: .glossary} version to be installed before you continue.

{%- if device.before_install.version %}
- LineageOS builds for this device require an **Android {{ device.before_install.version }}** version of the [stock OS]({{ "glossary/#stock-rom" | absolute_url }}){: .glossary} to be installed prior to following the installation guide
- The current Android version can usually be found in the "About Phone" section in Settings.
- If the vendor provided multiple updates for that Android version, e.g. security updates, make sure you are on the latest!
- Please ensure that you are checking the Android version, and not the vendor OS version
- **Important**: If your current Android version is newer or older than the required version, please upgrade or downgrade to the required version before proceeding (guides can be found on the internet!).

{%- elsif device.before_install_device_variants and device.before_install_device_variants.size > 0 %}

- The required firmware version is listed in the table below.
- The current firmware version can usually be found in the "About Phone" section in Settings.
- **Important**: If your current firmware version is newer or older than the required version, or you are not sure what firmware version you are currently on, please upgrade or downgrade to the required version before proceeding by following [this guide]({{ device | device_link: "/fw_update" | relative_url }}).
{%- endif %}
- Being on another custom ROM, including unofficial builds of the same version of LineageOS, does not ensure that this requirement has been fulfilled
- Please re-read this section as many times as necessary to fully understand the requirements
{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
  | Device Model    |  Firmware version |
  | --------------- | ----------------- |
  {%- for variant in device.before_install_device_variants %}
  | {{ variant.device }} | {{ variant.firmware }} |
  {%- endfor %}
  {: .table }

**Important**: Failing to install the correct {%- if device.before_install.version %}
Android {%- else %} firmware {%- endif %} version before continuing this installation may result in failure to install LineageOS, unexpected crashes post-installation, or permanent damage to your device!
{%- endif %}
