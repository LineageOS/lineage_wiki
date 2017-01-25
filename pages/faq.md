---
sidebar: home_sidebar
title: Frequently Asked Questions
permalink: faq.html
---

## Installing LineageOS zips in TWRP results in "Error 7"
 - This is quite an ambiguous error, and above it is the actual error causing the problem, which most commonly is due to one of the following scenarios:
  - You have downloaded the zip for the incorrect device. _You need to make sure you download the zip for the correct device *and* variant_
  - You are attempting to migrate from Cyanogen*Mod* 13 or 14.1 to LineageOS. _To do this, you need to flash the migration zip, marked as 'experimental'_
  - Your vendor/firmware/bootloader/radio is too old (or maybe too new). _Flash the latest stock image for your device, before wiping data and attempting to install LineageOS again_
 - If your error still persists after checking the above scenarios, ask someone for help IRC (#lineageos@freenode) or on the [Subreddit](http://reddit.com/r/lineageos)

## There are watermarks saying "cm to lineage migration" on every screen
 - You have flashed the migration build (marked as 'experimental'), presumably to migrate from CyanogenMod to LineageOS. After you have flashed the experimental build, and it has booted successfully, flash the regular weekly/nightly zip

## My device _is_ officially supported, but there's no zips for it on the download page. Where are they?
 - Be patient. Devices are slowly being built throughout the week. If it's not on [this page](http://wiki.lineageos.org/devices.html), it's not officially supported, so will not be built. Please do not ask for ETAs.

## My device is _not_ officially supported, but I'd really like to give LineageOS a try. Can you support my device?
 - Porting LineageOS to a new device is not a task to be viewed as easy, so it is something we can always or often say "Yes!" to. It's possible someone has some 'unofficial' builds available, perhaps on XDA, so you could try those. However, we are not responsible for bugs or permanent errors, as this responsibility falls to you and you only.

## I found a bug. What do I do?
 - Does the bug occur on a clean install (eg. Wipe data and try again). If it does, great, you've found a bug. This will soon be able to be reported on [Jira](http://jira.lineageos.org) - the bug reporting system.
 - The first thing we'd like to avoid is lots of people reporting the bug all at once. Check [Jira](http://jira.lineageos.org) or the [Subreddit](http://reddit.com/r/lineageos), to see if this has been mentioned before
 - If it hasn't been reported before, we'd like to know whether this occurs on a clean flash of LineageOS, to ensure it isn't anything brought across after migrating from CM13 or CM14.1
 - If it hasn't been reported before and occurs on a clean flash, we need as much information as possible, such as your device, how to reproduce the issue, and the severity

## Can I have _xxx_ feature added?
 - At the moment, we'd like to fix as many bugs as possible, so adding features isn't a huge priority.

## Are there any bugs?
 - Yes. You can track them on [Jira](http://jira.lineageos.org). 
