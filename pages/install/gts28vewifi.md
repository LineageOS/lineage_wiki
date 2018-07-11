---
sidebar: home_sidebar
title: Install LineageOS on gts28vewifi
folder: install
permalink: /devices/gts28vewifi/install
device: gts28vewifi
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
