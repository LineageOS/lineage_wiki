{%- assign skip = false %}
{%- if page.folder == "upgrade" and device.before_install.lineage_version > 0 and device.before_install.lineage_version == device.versions[0] %}
{%- assign skip = true %}
{%- endif %}

{%- unless skip == true %}
{% capture content -%}

Your device needs a specific [firmware]({{ "glossary#firmware" | absolute_url }}){: .glossary} version before proceeding.<br/>
If your device is currently using a newer or older version than the required version, please up- or downgrade to the required version before proceeding with your LineageOS installation.
<br/><br/>
{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
The required version can be found in the table below.
{%- else %}
The required version is **Android {{ device.before_install.version }}**, which may be lower than the LineageOS version you are about to install - this is not an error!<br/>
If there are multiple updates of that version (e.g. security updates), make sure to use the latest!
{%- endif %}
<br/><br/>

{%- if device.firmware_update and page.url contains "upgrade" or device.before_install_device_variants %}
You can update your firmware by following [this guide]({{ device | device_link: "fw_update" | relative_url }}).
{%- else %}
If you need to upgrade or downgrade your device, please search online for guides.<br/>
We are unable to provide specific instructions here and on our support platforms.
{%- endif %}

{%- unless page.folder == "install" %}
{%- if device.before_install.lineage_version > 0 %}
<br/><br/>
This requirement is already met when you are upgrading from **LineageOS {{ device.before_install.lineage_version }}** or newer!
{%- endif %}
{%- endunless %}
{%- endcapture %}

{% include alerts/warning.html content=content %}

{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
| Device Model | Firmware Version |
|--------------|------------------|
{%- for el in device.before_install_device_variants %}
| {{ el.device }} | {{ el.firmware }} |
{%- endfor %}
{: .table }
{%- endif %}
{%- endunless %}
