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

{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}
{% assign url = "devices/" | append: device.codename | relative_url %}
| **Device** | **Codename** | **Type** |{% for device in sorted %}
| [ {{ device.vendor }} {{ device.name }} ]({{ url }}) |  [{{ device.codename }}]({{ url }}) | {{ device.type | capitalize }} |{% endfor %}
