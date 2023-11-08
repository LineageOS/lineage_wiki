---
sidebar: home_sidebar
title: LineageOS contributors
permalink: contributors.html
---

{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}
{% assign sorted = devices | sort: 'name' | sort: 'vendor' %}

## Maintainers

### Head Developers (LineageOS Directors)

Head Developers have extensive knowledge of the OS, and are project leads. These people have responsibility over the direction of
the project and are committed to improving it.

| Name | Nickname |
|------|----------|
| Bruno Martins | bgcngm |
| Chirayu Desai | cdesai |
| Kevin Haggerty | haggertk |
| Luca Stefani | luca020400 |
| Łukasz Patron | LuK1337 |
| Michael Bestas | mikeioannina |
| Rashed Abdel-Tawab | rashed |
| Tom Powell | zifnab |
| razorloves | razorloves |
{: .table }

### Retired Directors

These individuals lead the project in the past, but have since stepped down.

| Name | Nickname |
|------|----------|
| Abhisek Devkota | ciwrl |
| Sam Mortimer | sam3000 |
| Simon Shields | forkbomb |
{: .table}

### Committers

Committers are responsible for testing commits and merging them in high flowrate situations. These developers have merge rights across the board.

| Name | Nickname |
|------|----------|
| Danny Baumann | maniac103 |
| Jan Altensen | Stricted |
| Joey Rizzoli | joeyrizzoli |
| Michael W. | baddaemon |
| Paul Keith | javelinanddart |
{: .table }

### Reviewers

Reviewers are known to provide consistent constructive feedback in line with project rules and guidelines. As a result,
their feedback is held as backed by project leads and recognized as a distinct group from general public reviewers.

| Name | Nickname |
|------|----------|
| Björn Lundén | blunden |
| Georg Veichtlbauer | vware |
| Nolen Johnson | npjohnson |
| Scott Warner | Tortel |
| Timi Rautamäki | trautamaki |
{: .table }

### Device maintainers

{%- include snippets/branches.md %}
{%- assign versions = "" | split: " " %}
{%- assign versions = versions | push: current_branch %}
{%- assign versions = versions | push: branch_minus_1 %}
{%- assign versions = versions | push: branch_minus_2 %}

{% for version in versions %}

#### LineageOS {{ version }}

<table class="table">
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

### Developer relations managers

Developer relations managers are responsible for onboarding new contributors, reviewing incoming submissions, fielding public questions, and for keeping the health of the project.
Although everyone has a responsibility to help new people join the community, and to protect the project's health, these people maintain the contribution
pathways that connect to potential contributors to teams that have contribution opportunities and grant new device maintainers access to devices.

| Name | Nickname |
|------|----------|
| Kevin Haggerty | haggertk |
| Nolen Johnson | npjohnson |
| Tom Powell | zifnab |
{: .table }

### Infrastructure managers

Infrastructure Managers are responsible for running the day-to-day infrastructure and managing internal signing processes.

| Name | Nickname |
|------|----------|
| Chirayu Desai | cdesai |
| Tom Powell | zifnab |
{: .table }


## Translations

We use [crowdin](https://crowdin.com/profile/LineageOS) as our translation system. To see how that works and how to contribute, click [here]({{ "how-to/translate" | relative_url }})

### Translations managers

Translation managers are responsible for the general project. They approve new memberships and are responsible for keeping LineageOS and the translations in sync.

<table class="table">
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

<table class="table">
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

### Wiki

If you want to contribute to the wiki yourself, you can find instructions on how to do so [here]({{ "contributing.html" | relative_url }}).
The following people are responsible for the verification of the contents and the general maintenance of the wiki:

| Name | Nickname |
|------|----------|
| Bruno Martins | bgcngm |
| Michael W | baddaemon |
| Nolen Johnson | npjohnson |
| razorloves | razorloves |
{: .table }
