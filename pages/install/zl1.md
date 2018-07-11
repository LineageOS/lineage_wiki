---
sidebar: home_sidebar
title: Install LineageOS on zl1
folder: install
permalink: /devices/zl1/install
device: zl1
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
