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
  - Problems with the website
  - Asking for installation help
  - Asking for device support
  - Feature requests

## Reporting a bug

We use [JIRA](https://jira.lineageos.org) as our bug tracker. Before you submit a bug, please search to verify that someone else hasn't reported it already. If they have, avoid commenting with "+1" or "Me too!", as this just creates more work for us.

Two types of bugs are currently accepted:

  - [Regressions](https://jira.lineageos.org/browse/REGRESSION)
    - These are *specifically* new problems between one build and another.
    - Example: the fingerprint sensor on your device worked on last week's build, and it no longer works.
  - [Nightly/Weekly Bugs](https://jira.lineageos.org/browse/BUGBASH)
    - These are accepted weekly from Midnight UTC on Friday through Midnight UTC on Monday, and can be any problems. Additional attachments and comments can be added at any time to already open bugs.
    - Example: the fingerprint sensor on your device has never worked, and Android shows it as a toaster.

Please be sure to fill out every field with accurate information. It doesn't matter if your baseband version has nothing to do with a lock screen animation issue, if it is not there your bug will be removed. [Logcats](/logcat.html) *must* be attached for all bugs, and *must* be captured right after reproducing the issue.
