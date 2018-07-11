---
sidebar: home_sidebar
title: Install LineageOS on klteduos
folder: install
permalink: /devices/klteduos/install
device: klteduos
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
