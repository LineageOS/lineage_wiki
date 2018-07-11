---
sidebar: home_sidebar
title: Install LineageOS on ha3g
folder: install
permalink: /devices/ha3g/install
device: ha3g
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
