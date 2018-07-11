---
sidebar: home_sidebar
title: Install LineageOS on n2awifi
folder: install
permalink: /devices/n2awifi/install
device: n2awifi
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
