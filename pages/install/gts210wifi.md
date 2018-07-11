---
sidebar: home_sidebar
title: Install LineageOS on gts210wifi
folder: install
permalink: /devices/gts210wifi/install
device: gts210wifi
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
