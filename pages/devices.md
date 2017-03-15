---
sidebar: home_sidebar
title: Devices
permalink: devices/
redirect_from: devices.html
---
{% assign devices = "" |split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign sorted = devices|sort:'name'|sort:'vendor' %}
| **device** | **codename** | **type** |{% for device in sorted %}
| [ {{ device.vendor }} {{ device.name }} ]({{ "devices/" | append: device.codename | relative_url }}) |  [{{ device.codename }}]({{ "devices/" | append: device.codename | relative_url }}) | {{ device.type }} |{% endfor %}
