{% capture content -%}
Before following these instructions please ensure that the device is currently using **Android {{ device.before_install_args.version }}** firmware.<br/>
If the vendor provided multiple updates for that version, e.g. security updates, make sure you are on the latest!<br/>
If your current installation is newer or older than **Android {{ device.before_install_args.version }}**, please up- or downgrade to the required version before proceeding<br/>
{%- if device.firmware_update and page.url contains "upgrade" %}
by following [this guide]({{ "devices/" | append: device.codename | append: "/fw_update" | relative_url }})
{%- else %}
(guides can be found on the internet!).
{%- endif %}
{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
You can find required firmware version for your device below.
{%- endif %}
{%- endcapture %}

{% include alerts/warning.html content=content %}

{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
<table class="table">
<thead>
<tr><th>Device</th><th>Firmware version</th></tr>
</thead>
<tbody>
{%- for el in device.before_install_device_variants %}
<tr><td>{{ el.device }}</td><td>{{ el.firmware }}</td></tr>
{%- endfor %}
</tbody>
</table>
{%- endif %}
