---
sidebar: home_sidebar
title: Install LineageOS on d2spr
folder: install
permalink: /devices/d2spr/install
device: d2spr
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
