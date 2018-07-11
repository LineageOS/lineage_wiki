---
sidebar: home_sidebar
title: Install LineageOS on chiron
folder: install
permalink: /devices/chiron/install
device: chiron
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
