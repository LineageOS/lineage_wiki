---
sidebar: home_sidebar
title: Install LineageOS on crackling
folder: install
permalink: /devices/crackling/install
device: crackling
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
