---
sidebar: home_sidebar
title: Install LineageOS on nash
folder: install
permalink: /devices/nash/install
device: nash
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
