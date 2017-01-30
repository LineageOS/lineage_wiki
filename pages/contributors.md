---
sidebar: home_sidebar
title: LineageOS contributors
permalink: contributors.html
versions: [14.1, 13.0]
---

{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

## Maintainers

### Trusted reviewers

Trusted reviewers are known to provide consistent constructive feedback in line with project rules and guidelines. As a result, 
their feedback is held as backed by project leads and recognized as a distinct group from general public reviewers.

| Name | Nickname |
|------|----------|
| Arne Coucheron | arco |
| Björn Lundén | blunden |
| Brandon McAnsh | bmc08gt |
| Christopher R Palmer | crpalmer |
| Kevin Haggerty | haggertk |
| Matt Mower | mdmower |
| Michael W. | BadDaemon |
| Scott Warner | Tortel |
| Simon Shields | forkbomb |

### Committers

Committers are responsible for testing commits and merging them in high flowrate situations. These developers have merge rights across the board.

| Name | Nickname |
|------|----------|
| Brinly Taylor | brinlyau |
| Christopher N. Hesse | raymanfx |
| Clark Scheff | D34D |
| Daniel Hillenbrand | codeworkx |
| Joey Rizzoli | joeyrizzoli |
| Luca Stefani | luca020400 |
| Luk1337 | Luk1337 |
| Rashed Abdel-Tawab | rashed |
| Zhao Wei Liew | zwliew |

### Developer relations managers

Developer relations managers are responsible for running the day-to-day infrastructure and for keeping the health of the project.
Although everyone has a responsibility to help new people join the community and protect the project’s health, these people maintain the contribution
pathways that connect to potential contributors to teams that have contribution opportunities and grant new device maintainers access to devices.

| Name | Nickname |
|------|----------|
| Abhisek Devkota | ciwrl |
| Tom Powell | zifnab |

### Device maintainers

{% assign sorted = devices|sort:'name'|sort:'vendor' %}
{% for v in page.versions %}

#### LineageOS {{ v }}

{% for device in sorted %}
{% unless device.current_branch == v %}
{% continue %}
{% endunless %}
* [__{{ device.vendor }} {{ device.name }} ({{ device.codename }})__]({{ device.codename }}_info.html): {{ device.maintainers | join: ', ' }}
{% endfor %}

{% endfor %}

## Translations

### Translation managers

<table>
<thead>
<tr><th>Name</th><th>Nickname</th></tr>
</thead>
<tbody>
{% for el in site.data.translators.managers %}
<tr><td>{{ el.name }}</td><td>{{ el.nick }}</td></tr>
{% endfor %}
</tbody>
</table>

### Translation proofreaders

{% for lang in site.data.translators.languages %}
* __{{ lang.name }}__: {{ lang.proofreaders | join: ', ' }}
{% endfor %}
