---
sidebar: home_sidebar
title: Install LineageOS on karin_windy
folder: install
permalink: /devices/karin_windy/install
device: karin_windy
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
