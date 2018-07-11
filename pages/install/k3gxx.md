---
sidebar: home_sidebar
title: Install LineageOS on k3gxx
folder: install
permalink: /devices/k3gxx/install
device: k3gxx
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
