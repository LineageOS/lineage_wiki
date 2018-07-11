---
sidebar: home_sidebar
title: Install LineageOS on oneplus3
folder: install
permalink: /devices/oneplus3/install
device: oneplus3
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
