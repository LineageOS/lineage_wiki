---
title: All Content
sidebar: home_sidebar
permalink: pages.html
---

{% assign sorted_pages = (site.pages | sort: 'title') %}

{% for page in sorted_pages %}
{% assign device_size = (page.url | split:"devices/" | size) %}
{% unless page.search == "exclude" or page.url == "pages.html" or device_size == 2 %}
{% if page.title and page.url %}
- [{{page.title}}]({{ page.url | relative_url }})
{% endif %}
{% endunless %}
{% endfor %}
