---
sidebar: home_sidebar
title: Install LineageOS on serrano3gxx
folder: install
permalink: /devices/serrano3gxx/install
device: serrano3gxx
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
