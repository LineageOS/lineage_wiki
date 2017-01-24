---
sidebar: home_sidebar
title: Devices
permalink: devices.html
---
{% assign devices = "" |split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign sorted = devices|sort:'name'|sort:'vendor' %}
{% for device in sorted %}
* [ {{ device.vendor }} {{ device.name }} &ndash; {{ device.codename }}](/{{ device.codename }}_info.html)
{% endfor %}
