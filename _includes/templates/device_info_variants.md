{%- assign devices = "" | split: " " %}
{%- for dev in site.data.devices %}
  {%- if dev[1].codename == page.device%}
    {%- assign devices = devices | push: dev[1] %}
  {%- endif %}
{%- endfor %}
{%- assign sorted = devices | sort_natural: 'name' %}

<br/>
The following devices are all using the same build, either because the vendor released the same device with different names or the maintainer chose or managed to support multiple devices using the same code.

{% include alerts/important.html content="Instructions may vary between these variants, so please choose your actual model!" %}

{%- for device in sorted %}
- [{{ device.name }}]({{ "/devices/" | append: device.codename | append: "/variant" | append: device.variant | append: "/" | relative_url}})
{%- endfor %}
