---
sidebar: home_sidebar
title: Install LineageOS on m8d
folder: install
permalink: /devices/m8d/install
device: m8d
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
