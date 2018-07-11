---
sidebar: home_sidebar
title: Install LineageOS on a7y17lte
folder: install
permalink: /devices/a7y17lte/install
device: a7y17lte
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
