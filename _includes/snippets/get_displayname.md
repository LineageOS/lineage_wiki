{%- capture testValue %}{{ include.device.name | divided_by:1 }}{% endcapture %}
{%- if testValue != "0" or include.device.vendor == "OnePlus" %}{% assign display_name = include.device.vendor | append: ' ' | append: include.device.name %}
{%- else %}{% assign display_name = include.device.name %}{% endif %}
