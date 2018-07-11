---
sidebar: home_sidebar
title: Install LineageOS on mt2
folder: install
permalink: /devices/mt2/install
device: mt2
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
