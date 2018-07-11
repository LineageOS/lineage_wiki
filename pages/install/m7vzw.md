---
sidebar: home_sidebar
title: Install LineageOS on m7vzw
folder: install
permalink: /devices/m7vzw/install
device: m7vzw
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
