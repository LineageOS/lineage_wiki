---
sidebar: home_sidebar
title: Install LineageOS on hammerhead
folder: install
permalink: /devices/hammerhead/install
device: hammerhead
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
