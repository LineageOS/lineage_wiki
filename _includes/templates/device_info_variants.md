{% assign device = site.data.devices[page.device] %}

{%- assign devices = "" | split: " " %}
{%- for device in site.data.devices %}
{% if device[0] contains page.device %}
{%- assign devices = devices | push: device[1] %}
{%- endif %}
{%- endfor %}
{%- assign sorted = devices | sort_natural: 'name' | sort_natural: 'vendor' %}

<br/>
This page is a placeholder for the following devices. Please note that these are commonized and all use the same build!

{% for device in sorted %}
- [{{ device.name }}]({{ "/devices/" | append: device.codename | append: "/variant" | append: device.variant | append: "/" | relative_url}})
{% endfor %}