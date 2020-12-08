---
title: How-to ...
sidebar: home_sidebar
redirect_from: how-tos.html
permalink: /how-to/
tags:
toc: false
---

{% assign sorted_pages = site.pages | sort: 'title' %}

{% for page in sorted_pages %}
{% if page.title and page.url and page.tags contains "how-to" %}
- [{{ page.title | replace_first:'How to', '...' }}]({{ page.url | relative_url }})
{% endif %}
{% endfor %}
