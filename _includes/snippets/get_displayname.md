{%- capture testValue %}{{ include.device.name | divided_by:1 }}{% endcapture %}
{%- if testValue != "0" or include.device.vendor == "OnePlus" or include.device.vendor == "Realme" %}{% assign display_name = include.device.vendor | append: ' ' | append: include.device.name %}
{%- elsif include.show_vendor == false or include.device.name contains include.device.vendor %}{% assign display_name = include.device.name %}
{%- else %}{% assign display_name = include.device.vendor | append: ' ' | append: include.device.name %}{% endif %}
