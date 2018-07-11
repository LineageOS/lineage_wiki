---
sidebar: home_sidebar
title: Install LineageOS on hero2lte
folder: install
permalink: /devices/hero2lte/install
device: hero2lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
