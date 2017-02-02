---
sidebar: home_sidebar
title: How-to's list
permalink: how-tos.html
---

{% assign sorted_pages = (site.pages | sort: 'title') %}

{% for page in sorted_pages %}
{% if page.title and page.url and page.tags == "how-to" %}
- [{{page.title}}]({{page.url}})
{% endif %}
{% endfor %}
