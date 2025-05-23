---
sidebar: home_sidebar
title: How to submit a bug report
folder: how-tos
redirect_from: bugreport-howto.html
permalink: /how-to/bugreport/
tags:
 - how-to
---

## What not to report
  - Bugs in unofficial builds or anything not downloaded from [our official portal](https://download.lineageos.org/)
  - Missing builds
  - Asking for installation help
  - Asking for device support
  - Feature requests

## Reporting a bug

We use Gitlab Issues as our bug tracker. Before you submit a bug, please search to verify that someone else hasn't reported it already.

Please do not:
- Post "Me too" or "+1" messages on existing reports
- Comment your device as affected on a report for a different device - different devices have different maintainers, and different reasons for bugs to exist
- Ask if it is fixed already - if the report is still open it probably is still present!
- Ask for status updates - we can't provide them (no ETA!)
- Ping people/maintainers - most of them already check the tracker

We accept bugs on the following:

### Android bugs

These are bugs in LineageOS itself, e.g.
  - The fingerprint sensor on your device doesn't work.
  - Your phone crashes when you try to enable encryption.
  - WiFi calling doesn't work.

When adding a bug report, please do **not** use the email functionality, since we provide a template that needs to be filled out properly.

Please read the template carefully and pay special attention to the last section, containing lines starting with `/`.
These lines are parsed by a bot which will mark your issue as invalid if you do not fill them out properly.
Keep the lines exactly as they are and add your information next to it, e.g. `/device codename` or `/version lineage-19.1` but not `/device My Device (codename)` - which the bot will not be able to parse.

Most of the requested information can be found on your device if you go to *Settings->About phone* and click on the `Android version` item.

Make sure to fill out the template with accurate information, and in the format requested. It doesn't matter if your baseband version has nothing to do with a lock screen animation issue, if it is not there your bug will be closed.

  {%- capture content %}[Logcats]({{ "how-to/logcat/" | relative_url }}) *must* be attached for all Android bugs, and *must* be captured right after reproducing the issue. Without these, it is much more difficult and time-consuming for us to resolve the issue.{% endcapture %}
  {% include alerts/warning.html content=content %}

{% include alerts/important.html content="Please submit each issue in a separate report. Some bugs may be device-specific or handled by different maintainers, and combining them can delay resolution." %}

<a href="https://gitlab.com/LineageOS/issues/android/-/issues"><button class="btn btn-primary">Go to Android bugs</button></a>

### Infrastructure bugs

These are bugs in our website and/or software, e.g.
  - The documentation on wiki is wrong.
  - The download portal doesn't render something correctly.
  - There's a dead link on the website.
  - An API returns something unexpected.

  {% include alerts/important.html content="If the issue affects your device, this is the **wrong** place to report your issue!" %}

<a href="https://gitlab.com/LineageOS/issues/infra/-/issues"><button class="btn btn-primary">Go to infrastructure bugs</button></a>
