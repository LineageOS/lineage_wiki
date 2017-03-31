---
sidebar: home_sidebar
title: Devices
permalink: devices/
redirect_from: devices.html
---
{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}

<table>
  <thead>
  <tr>
    <td><b>Device</b></td>
    <td><b>Codename</b></td>
    <td><b>Type</b></td>
  </tr>
  </thead>
  <tbody>
{% for device in sorted %}
  {% assign url = "devices/" | append: device.codename | relative_url %}
  {% if device.type contains "phone" %}{% assign icon = "phone_android" %}
  {% elsif device.type contains "tablet" %}{% assign icon = "tablet_android" %}
  {% elsif device.type contains "phablet" %}{% assign icon = "phone_android + tablet_android" %}
  {% elsif device.type contains "game" %}{% assign icon = "videogame_asset" %}
  {% else %}{% assign icon = "" %}
  {% endif %}
  <tr>
    <td><a href="{{ url}}">{{ device.name }}</a></td>
    <td><a href="{{ url}}">{{ device.codename }}</a></td>
    <td><i class='material-icons'>{{ icon }}</i> {{ device.type | capitalize }}</td>
  </tr>
{% endfor %}
  </tbody>
</table>
