---
sidebar: home_sidebar
title: How-tos list
permalink: how-tos.html
tags:
---

{% assign sorted_pages = (site.pages | sort: 'title') %}

{% for page in sorted_pages %}
{% if page.title and page.url and page.tags contains "how-to" %}
- [{{page.title}}]({{ page.url | relative_url }})
{% endif %}
{% endfor %}
