---
sidebar: home_sidebar
title: Install LineageOS on d2att
folder: install
permalink: /devices/d2att/install
device: d2att
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
