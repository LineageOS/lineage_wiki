---
sidebar: home_sidebar
title: Install LineageOS on lt02ltespr
folder: install
permalink: /devices/lt02ltespr/install
device: lt02ltespr
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
