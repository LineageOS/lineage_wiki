---
sidebar: home_sidebar
title: Install LineageOS on lt03lte
folder: install
permalink: /devices/lt03lte/install
device: lt03lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
