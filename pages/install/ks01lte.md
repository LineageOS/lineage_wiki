---
sidebar: home_sidebar
title: Install LineageOS on ks01lte
folder: install
permalink: /devices/ks01lte/install
device: ks01lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
