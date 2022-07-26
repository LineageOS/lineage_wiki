{% capture content -%}
Before following these instructions please ensure that the device is currently using **Android {{ device.before_install_args.version }}** firmware.<br/>
If the vendor provided multiple updates for that version, e.g. security updates, make sure you are on the latest!<br/>
If your current installation is newer or older than **Android {{ device.before_install_args.version }}**, please up- or downgrade to the required version before proceeding
{%- if device.firmware_update %}
by following [this guide]({{ "devices/" | append: device.codename | append: "/fw_update" | relative_url }})
{%- else %}
(guides can be found on the internet!).
{%- endif %}
{%- endcapture %}

{% include alerts/warning.html content=content %}
