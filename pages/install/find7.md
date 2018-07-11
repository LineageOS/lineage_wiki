---
sidebar: home_sidebar
title: Install LineageOS on find7
folder: install
permalink: /devices/find7/install
device: find7
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
