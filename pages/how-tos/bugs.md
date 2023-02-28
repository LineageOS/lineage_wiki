---
sidebar: home_sidebar
title: How to submit a bug report
folder: how-tos
redirect_from: bugreport-howto.html
permalink: /how-to/bugreport
tags:
 - how-to
---

## What not to report
  - Bugs in unofficial builds or anything not downloaded from [our official portal](https://download-beta.lineageos.org/)
  - Missing builds
  - Asking for installation help
  - Asking for device support
  - Feature requests

## Reporting a bug

We use Gitlab Issues as our bug tracker. Before you submit a bug, please search to verify that someone else hasn't reported it already. If they have, avoid commenting with "+1" or "Me too!", as this just creates more work for us.

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

  {% include alerts/important.html content="Please do not post multiple issues within the same report, as bugs can be either affecting different maintainers or some may be device specific where others are not" %}

  {% include alerts/important.html content="[Logcats](logcat.html) *must* be attached for all Android bugs, and *must* be captured right after reproducing the issue." %}

<a href="https://gitlab.com/LineageOS/issues/android/-/issues"><button class="btn btn-primary">Go to Android bugs</button></a>

### Infrastructure bugs

These are bugs in our website and/or software, e.g.
  - The download portal doesn't render something correctly.
  - There's a dead link on the website.
  - An API returns something unexpected.

  {% include alerts/important.html content="If the issue affects your device, this is the **wrong** place to report your issue!" %}

<a href="https://gitlab.com/LineageOS/issues/infra/-/issues"><button class="btn btn-primary">Go to infrastructure bugs</button></a>
