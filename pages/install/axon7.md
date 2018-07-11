---
sidebar: home_sidebar
title: Install LineageOS on axon7
folder: install
permalink: /devices/axon7/install
device: axon7
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
