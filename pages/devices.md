---
sidebar: home_sidebar
title: Devices
permalink: devices/
redirect_from: devices.html
---
{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}
{% assign lastVendor = "" %}

{% for device in sorted %}
{% if device.vendor != lastVendor %}
{% assign lastVendor = device.vendor %}
## {{ device.vendor}}

<table class="device">
  <thead>
  <tr>
    <th><b>Device</b></th>
    <th><b>Codename</b></th>
    <th><b>Type</b></th>
    <th><b>Version</b></th>
    <th><b>Maintainers</b></th>
  </tr>
  </thead>
{% endif %}
  {% if device.vendor == "OnePlus" %}{% assign deviceName = device.vendor | append: ' ' | append: device.name %}
  {% else %}{% assign deviceName = device.name %}
  {% endif %}
  {% assign url = "devices/" | append: device.codename | relative_url %}
  <tr>
    <td onClick="location.href='{{ url }}'"><a href="{{ url }}">{{ deviceName }}</a></td>
    <td onClick="location.href='{{ url }}'"><a href="{{ url }}">{{ device.codename }}</a></td>
    <td>{{ device.type | capitalize }}</td>
    <td>{{ device.versions | join: ", " }}</td>
    <td>{{ device.maintainers | join: ", " }}</td>
  </tr>
{% unless forloop.last %}
  {% if sorted[forloop.index].vendor != lastVendor %}
  </table>
  {% endif %}
{% endunless %}
{% endfor %}
