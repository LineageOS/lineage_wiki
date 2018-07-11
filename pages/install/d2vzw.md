---
sidebar: home_sidebar
title: Install LineageOS on d2vzw
folder: install
permalink: /devices/d2vzw/install
device: d2vzw
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
