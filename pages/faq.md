---
sidebar: home_sidebar
title: Frequently Asked Questions
permalink: faq.html
---

## Installing LineageOS zips in TWRP results in "Error 7"
 - This is a common error, and actual error is usually printed above this line. The most common reasons are:
  - You have downloaded the zip for the incorrect device. _You need to make sure you download the zip for the correct device *and* variant_
  - You are attempting to migrate from Cyanogen*Mod* 13 or 14.1 to LineageOS. _To do this, you need to flash the migration zip, marked as 'experimental'_
  - Your vendor/firmware/bootloader/radio is too old (or maybe too new). _Flash the correct stock image for your device, before wiping data and attempting to install LineageOS again_
 - If your error still persists after confirming these are not causing your issue, ask someone for help IRC (#lineageos@freenode) or on the [Subreddit](http://reddit.com/r/lineageos) and provide a recovery log

## There are watermarks saying "cm to lineage migration" on every screen
 - You have flashed the migration build (marked as 'experimental'), which is not meant to be used forever. After you have flashed the experimental build, and it has booted successfully, flash the regular weekly/nightly zip

## My device _is_ officially supported, but there's no zips for it on the download page. Where are they?
 - Be patient. Devices are slowly being built throughout the week. Maintainers have busy lives, and sometimes an issue is holding it back. Please do not ask for ETAs.

## My device is _not_ officially supported, but I'd really like to give LineageOS a try. Can you support my device?
 - Porting LineageOS to a new device is not a trivial task. We'd love to support more devices, and there is no way we can own all possible devices. It's possible someone has some 'unofficial' builds available, perhaps on XDA, so you could try those. However, we are not responsible for any issues that occur. This responsibility falls to you and you only.

## I found a bug. What do I do?
 - Check if the bug occurs on a clean install (eg. Wipe data and try again). If it does, great! You've found a bug. Soon, you will be able to report it on [Jira](http://jira.lineageos.org) - the bug tracking system.
 - We'd like to avoid is lots of people reporting the same bug all at once. Check [Jira](http://jira.lineageos.org) or the [Subreddit](http://reddit.com/r/lineageos), to see if this has been mentioned before
 - If it hasn't been reported before, we'd like to know whether this occurs on a clean flash of LineageOS, to ensure that the error isn't on your side
 - If it hasn't been reported before and occurs on a clean flash, we need as much information as possible, such as your device, how to reproduce the issue, severity, and logs

## Can I have _xxx_ feature added?
 - At the moment, we'd like to get as many bugs fixed as possible, so adding features isn't a huge priority.

## Are there any bugs?
 - Yes. You can track them on [Jira](http://jira.lineageos.org). 
