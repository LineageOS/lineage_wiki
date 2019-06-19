---
sidebar: home_sidebar
title: How to submit a bug report
folder: how-tos
permalink: bugreport-howto.html
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

We use [Gitlab Issues](https://gitlab.com/LineageOS/issues) as our bug tracker. Before you submit a bug, please search to verify that someone else hasn't reported it already. If they have, avoid commenting with "+1" or "Me too!", as this just creates more work for us.

We accept bugs on the following:

  - [Android](https://gitlab.com/LineageOS/issues/android)
    - These are bugs in LineageOS.
    - Examples:
      - The fingerprint sensor on your device doesn't work.
      - Your phone crashes when you try to enable encryption.
      - WiFi calling doesn't work.

  - [Infrastructure](https://gitlab.com/LineageOS/issues/infra)
    - These are bugs in our website and/or software.
    - Examples:
      - The download portal doesn't render something correctly.
      - There's a dead link on the website.
      - An API returns something unexpected.

Please be sure to fill out the template with accurate information, and in the format requested. It doesn't matter if your baseband version has nothing to do with a lock screen animation issue, if it is not there your bug will be removed. [Logcats](logcat.html) *must* be attached for all android bugs, and *must* be captured right after reproducing the issue.
