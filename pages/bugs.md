---
sidebar: home_sidebar
title: How to submit a bug report
permalink: bugreport-howto.html
---

## What not to report
  - bugs in unofficial builds or anything not from download.lineageos.org
  - missing builds
  - problems with the website
  - asking for installation help
  - asking for device support
  - feature requests

## Reporting a bug

We use [JIRA](https://jira.lineageos.org) as our bugtracker. Before you submit a bug, please search to verify that someone else hasn't reported it already. If they have, avoid commenting with "+1" or "Me too!", as this just creates more work for us.

Two types of bugs are currently accepted:

  - [Regressions](https://jira.lineageos.org/browse/REGRESSION)
    - These are *specifically* new problems between one build and another.
    - Example: the fingerprint sensor on your device worked on last week's build, and it no longer works.
  - [Nightly/Weekly Bugs](https://jira.lineageos.org/browse/BUGBASH)
    - These are accepted weekly from Midnight UTC on Friday through Midnight UTC on Monday, and can be any problems. Additional attachments and comments can be added at any time to already open bugs.
    - Example: the fingerprint sensor on your device has never worked, and Android shows it as a toaster.

Please be sure to fill out every field with accurate information. It doesn't matter if your basemband version has nothing to do with a lock screen animation issue, if it is not there your bug will be removed. Logcats *must* be attached for all bugs, and *must* be captured right after reproducing the issue.
