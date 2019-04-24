---
title: Upgrade guides
sidebar: home_sidebar
permalink: upgrade_guides.html
redirect_from: upgrading.html
toc: false
---

{% assign sorted_pages = site.pages | sort: 'title' %}

{% for page in sorted_pages %}
{% if page.title and page.url and page.url contains "/devices/" and page.url contains "/upgrade" %}
- [{{page.title}}]({{ page.url | relative_url }})
{% endif %}
{% endfor %}
