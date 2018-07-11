---
sidebar: home_sidebar
title: Install LineageOS on n1awifi
folder: install
permalink: /devices/n1awifi/install
device: n1awifi
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
