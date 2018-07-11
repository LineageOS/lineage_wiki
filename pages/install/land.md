---
sidebar: home_sidebar
title: Install LineageOS on land
folder: install
permalink: /devices/land/install
device: land
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
