---
sidebar: home_sidebar
title: Install LineageOS on titan
folder: install
permalink: /devices/titan/install
device: titan
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
