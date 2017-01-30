---
sidebar: home_sidebar
title: Frequently Asked Questions
permalink: faq.html
---

## Installing LineageOS zips in TWRP results in "Error 7"
 - The most common reasons for this error are:
   - You are trying to install a build for a different device. _You need to make sure you download the zip for the correct device *and* variant_
   - You are atttempting to migrate from an unofficial build to LineageOS. _To do this, you need to flash the migration zip, marked as 'experimental'_
   - Your vendor/modem/bootloader is too old (or maybe too new). _Flash the correct stock image for your device, before wiping data and attempting to install LineageOS again_. This information should be listed on the device's wiki page.
 - If your error still persists after confirming these are not causing your issue, ask someone for help IRC (#lineageos@freenode) or on the [Subreddit](http://reddit.com/r/lineageos) and provide a recovery log

## There are watermarks saying "cm to lineage migration" on every screen
 - You have flashed the migration build (marked as 'experimental'). This build resets all package keys at boot, and **SHOULD NOT** be used outside of performing a migration. Please update to the latest build for your device.

## My device _is_ officially supported, but there's no zips for it on the download page. Where are they?
 - Be patient. Devices are slowly being built throughout the week. Maintainers have busy lives, and sometimes an issue is holding it back. Please do not ask for ETAs.

## My device is _not_ officially supported, but I'd really like to give LineageOS a try. Can you support my device?
 - All devices are maintained by open source contributors - if someone has a device, wants to port lineage to it, and can meet some basic standards, we're more than happy to make it official.
 - If you have a working device tree/kernel, and would like to submit it for official builds, please contact [devrel@lineageos.org](mailto:devrel@lineageos.org) with links to them. Please note - your device **must** have full hardware support (ie, every peripheral works) and **must** be stable.

## A build for my device dissappeared? Where'd it go?
 - Occassionaly a build is broken. If this happens, we remove it until the next build cycle.

## I found a bug. What do I do?
 - You can report it! Please _carefully_ read the [How to submit a bug](http://wiki.lineageos.org/bugreport-howto.html) page before reporting it.

## Can I have _xxx_ feature added?
 - Don't ask.

## My device doesn't pass SafetyNet!
 - Some devices pass their bootloader unlock status and verity status to android's kernel during boot. We don't purposefully remove those flags, as it isn't our place to lie about security features.

## Can you enable signature spoofing?
 - Once again, it isn't our place to lie about security features. No.
