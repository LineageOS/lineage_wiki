{% assign device = site.data.devices[page.device] %}

{%- assign devices = "" | split: " " %}
{%- for device in site.data.devices %}
  {%- if device[0] contains page.device %}
    {%- assign devices = devices | push: device[1] %}
  {%- endif %}
{%- endfor %}
{%- assign sorted = devices | sort_natural: 'name' %}

<br/>
The following devices are all using the same build, but instructions may vary, so please choose your actual model below:

{%- for device in sorted %}
- [{{ device.name }}]({{ "/devices/" | append: device.codename | append: "/variant" | append: device.variant | append: "/" | relative_url}})
{%- endfor %}
