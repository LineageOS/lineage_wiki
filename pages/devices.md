---
sidebar: home_sidebar
title: Devices
permalink: devices.html
---
{% for device in site.data.devices %}
* [{{ device[1].codename }} &ndash; {{ device[1].vendor }} {{ device[1].name }}](/{{ device[1].codename }}_Info.html)
{% endfor %}
