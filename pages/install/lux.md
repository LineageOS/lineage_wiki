---
sidebar: home_sidebar
title: Install LineageOS on lux
folder: install
permalink: /devices/lux/install
device: lux
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
