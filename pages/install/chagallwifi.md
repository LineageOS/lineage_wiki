---
sidebar: home_sidebar
title: Install LineageOS on chagallwifi
folder: install
permalink: /devices/chagallwifi/install
device: chagallwifi
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
