---
sidebar: home_sidebar
title: Devices
permalink: devices.html
---
{% assign devices = "" |split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign sorted = devices | sort: 'codename' %}
{% for device in sorted %}
* [{{ device.codename }} &ndash; {{ device.vendor }} {{ device.name }}](/{{ device.codename }}_Info.html)
{% endfor %}
