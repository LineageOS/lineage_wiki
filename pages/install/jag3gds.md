---
sidebar: home_sidebar
title: Install LineageOS on jag3gds
folder: install
permalink: /devices/jag3gds/install
device: jag3gds
---
{% assign device = site.data.devices[page.device] %}
{% if device.is_ab_device %}
{% include templates/device_install_ab.md %}
{% else %}
{% include templates/device_install.md %}
{% endif %}
