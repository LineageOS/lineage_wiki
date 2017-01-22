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
* [{{ device.codename }} &ndash; {{ device.vendor }} {{ device.name }}](info_about_{{ device.codename }}.html)
{% endfor %}
