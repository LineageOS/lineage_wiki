---
sidebar: home_sidebar
title: Install LineageOS on r7plus
folder: install
permalink: /devices/r7plus/install
device: r7plus
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
