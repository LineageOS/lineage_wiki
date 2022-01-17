{% capture content -%}
Before following these instructions please ensure that the device is on the latest **Android {{ device.before_install_args.version }}** firmware.<br/>
This is not necessarily the newest available version! Please up- or downgrade to the required version before proceeding
{%- if device.firmware_update and page.url contains "upgrade" %}
by following [this guide]({{ "devices/" | append: device.codename | append: "/fw_update" | relative_url }})
{%- else %}
(guides can be found on the internet!).
{%- endif %}
{%- endcapture %}

{% include alerts/warning.html content=content %}
