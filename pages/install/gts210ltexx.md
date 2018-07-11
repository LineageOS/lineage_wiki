---
sidebar: home_sidebar
title: Install LineageOS on gts210ltexx
folder: install
permalink: /devices/gts210ltexx/install
device: gts210ltexx
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
