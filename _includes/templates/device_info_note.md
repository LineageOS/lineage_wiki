{% assign device = site.data.devices[page.device] %}
## {{ device.note_title }}

* {{ device.note_content }}
{% if device.note_link and device.note_url and device.note_link != "" and device.note_url != "" %}
* **Link**: [{{ device.note_link }}]({{ device.note_url }})
{% endif %}
