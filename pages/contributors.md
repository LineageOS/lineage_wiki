---
sidebar: home_sidebar
title: LineageOS contributors
permalink: contributors.html
versions: [15.1, 14.1]
---

{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}
{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}

## Maintainers

### Head developers

Head developers have extensive knowledge of the OS, and are project leads. These people have responsibility over the direction of
the project and are committed to improving it.

| Name | Nickname |
|------|----------|
| Kevin F. Haggerty | haggertk |
| Luca Stefani | luca020400 |
| Łukasz Patron | LuK1337 |
| Michael Bestas | mikeioannina |
| Rashed Abdel-Tawab | rashed |
| Sam Mortimer | sam3000 |
| Simon Shields | forkbomb |
| Tom Powell | zifnab |
| razorloves | razorloves |

### Trusted reviewers

Trusted reviewers are known to provide consistent constructive feedback in line with project rules and guidelines. As a result, 
their feedback is held as backed by project leads and recognized as a distinct group from general public reviewers.

| Name | Nickname |
|------|----------|
| Björn Lundén | blunden |
| Brandon McAnsh | bmc08gt |
| Michael W. | BadDaemon |
| Scott Warner | Tortel |
| Shane Passmore | h8rift |

### Committers

Committers are responsible for testing commits and merging them in high flowrate situations. These developers have merge rights across the board.

| Name | Nickname |
|------|----------|
| Adrian DC | adriandc |
| Arne Coucheron | arco |
| Brinly Taylor | brinlyau |
| Bruno Martins | bgcngm |
| Chirayu Desai | cdesai |
| Christopher N. Hesse | raymanfx |
| Christopher R. Palmer | crpalmer |
| Clark Scheff | D34D |
| Dan Pasanen | invisiblek |
| Daniel Hillenbrand | codeworkx |
| Danny Baumann | maniac103 |
| Diogo Ferreira | defer |
| Ed Carrigan | senyor |
| Ethan Chen | intervigil |
| Gabriele M | gmrt |
| Harry Youd | harryyoud |
| Joey Rizzoli | joeyrizzoli |
| Jorge Ruesga | jruesga |
| Marcos Marado | marado |
| Olivier Karasangabo | olivier97 |
| Roman Birg | roman |
| Tom Marshall | tdm |
| Zhao Wei Liew | zwliew |

### Developer relations managers

Developer relations managers are responsible for running the day-to-day infrastructure and for keeping the health of the project.
Although everyone has a responsibility to help new people join the community and protect the project’s health, these people maintain the contribution
pathways that connect to potential contributors to teams that have contribution opportunities and grant new device maintainers access to devices.

| Name | Nickname |
|------|----------|
| Tom Powell | zifnab |

### Device maintainers

{% for version in page.versions %}

#### LineageOS {{ version }}

<table>
<thead>
<tr><th>Device</th><th>Maintainer(s)</th></tr>
</thead>
<tbody>
{%- for device in sorted %}
{%- assign numMaintainers = device.maintainers | size %}
{%- if device.current_branch != version or numMaintainers == 0 %}
{%- continue %}
{%- endif %}
<tr><td><b><a href="{{ "/devices/" | append: device.codename | relative_url }}">{{ device.vendor }} {{ device.name }} ({{ device.codename }})</a></b></td><td>{{ device.maintainers | join: ', ' }}</td></tr>
{%- endfor %}
</tbody>
</table>
{%- endfor %}

## Translations

We use [crowdin](https://crowdin.com/profile/LineageOS) as our translation system. To see how that works and how to contribute, click [here](/translate-howto.html)

### Translations managers

Translation managers are responsible for the general project. They approve new memberships and are responsible for keeping LineageOS and the translations in sync.

<table>
<thead>
<tr><th>Name</th><th>Nickname</th></tr>
</thead>
<tbody>
{%- for el in site.data.translators.managers %}
<tr><td>{{ el.name }}</td><td>{{ el.nick }}</td></tr>
{%- endfor %}
</tbody>
</table>

### Global proofreaders

Global proofreaders can help out across all languages.

<table>
<thead>
<tr><th>Name</th><th>Nickname</th></tr>
</thead>
<tbody>
{%- for el in site.data.translators.global_proofreaders %}
<tr><td>{{ el.name }}</td><td>{{ el.nick }}</td></tr>
{%- endfor %}
</tbody>
</table>

### Translations proofreaders

{%- for lang in site.data.translators.languages %}
* __{{ lang.name }}__: {{ lang.proofreaders | join: ', ' }}
{%- endfor %}

## Other projects

### Legacy branch reviewers

These people are responsible for reviewing changes on branches that no longer receive official builds (cm-11.0 and cm-13.0).

| Name | Nickname |
|------|----------|
| Andreas Blaesius | android-andi |
| Niks | niks255 |
| Tim Schumacher | timschumi |

### Mirror manifest

These people are responsible for [our mirror manifest](https://www.github.com/LineageOS/mirror).

| Name | Nickname |
|------|----------|
| Harry Youd | harryyoud |

### Website

These people are responsible for the content of [our website](https://www.lineageos.org/):

| Name | Nickname |
|------|----------|
| Harry Youd | harryyoud |
| Tom Powell | zifnab |

### Wiki

If you want to contribute to the wiki yourself, you can find instructions on how to do so [here]({{ "contributing.html" | relative_url }}).
The following people are responsible for the verification of the contents and the general maintenance of the wiki:

| Name | Nickname |
|------|----------|
| Bruno Martins | bgcngm |
| Michael W | baddaemon |
| Simon Shields | fourkbomb |
| razorloves | razorloves |
