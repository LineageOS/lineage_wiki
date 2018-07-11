---
sidebar: home_sidebar
title: Install LineageOS on g2m
folder: install
permalink: /devices/g2m/install
device: g2m
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
