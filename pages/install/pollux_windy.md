---
sidebar: home_sidebar
title: Install LineageOS on pollux_windy
folder: install
permalink: /devices/pollux_windy/install
device: pollux_windy
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
