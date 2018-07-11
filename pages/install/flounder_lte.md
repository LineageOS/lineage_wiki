---
sidebar: home_sidebar
title: Install LineageOS on flounder_lte
folder: install
permalink: /devices/flounder_lte/install
device: flounder_lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
