---
sidebar: home_sidebar
title: LineageOS Contributors
permalink: contributors.html
versions: [14.1, 13.0]
---

{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

## Maintainers

{% assign sorted = devices|sort:'name'|sort:'vendor' %}
{% for v in page.versions %}

### LineageOS {{ v }}

{% for device in sorted %}
{% unless device.current_branch == v %}
{% continue %}
{% endunless %}
* [__{{ device.vendor }} {{ device.name }} ({{ device.codename }})__]({{ device.codename }}_info.html): {{ device.maintainers | join: ', ' }}
{% endfor %}

{% endfor %}

## Translations

### Translation Managers

{{ site.data.translators.managers | join: ', ' }}

### Translation Proofreaders

{% for lang in site.data.translators.languages %}
* __{{ lang.name }}__: {{ lang.proofreaders | join: ', ' }}
{% endfor %}
