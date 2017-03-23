---
title: All Content
sidebar: home_sidebar
permalink: pages.html
tags: index
---

{% assign sorted_pages = (site.pages | sort: 'title') %}
{% assign ignore_tags = "index|how-to" | split: "|" %}

{% for page in sorted_pages %}
{% unless page.search == "exclude" or ignore_tags contains page.tags or page.device %}
{% if page.title and page.url %}
- [{{page.title}}]({{ page.url | relative_url }})
{% endif %}
{% endunless %}
{% endfor %}
