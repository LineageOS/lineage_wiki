## {{ site.data.devices[page.device].note_title }}

* {{ site.data.devices[page.device].note_content }}
{% if site.data.devices[page.device].note_link != "" and site.data.devices[page.device].note_url != "" %}
* **Link**: [{{ site.data.devices[page.device].note_link }}]({{ site.data.devices[page.device].note_url }})
{% endif %}
