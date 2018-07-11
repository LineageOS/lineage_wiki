---
sidebar: home_sidebar
title: Install LineageOS on t0lte
folder: install
permalink: /devices/t0lte/install
device: t0lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
