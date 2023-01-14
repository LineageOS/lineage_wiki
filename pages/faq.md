---
sidebar: home_sidebar
title: Frequently Asked Questions
permalink: faq.html
---

{% include snippets/branches.md %}

## Installing LineageOS zips in Recovery results in "Error 7"
 - The most common reasons for this error are:
   - You are trying to install a build for a different device. _You need to make sure you download the zip for the correct device *and* variant_
   - You are attempting to migrate from an unofficial build to official LineageOS. _A full data wipe is needed if you are coming from something other than an official build of LineageOS._
   - Your vendor/modem/bootloader is too old (or maybe too new). _Flash the correct stock image for your device, before wiping data and attempting to install LineageOS again_. This information should be listed on the device's wiki page.
   - Your recovery is outdated. _Flash the newest available version of the recommended recovery image for your device_.
 - If your error still persists after confirming these are not causing your issue, ask someone for help on IRC [#lineageos@Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos) or on the [subreddit](http://reddit.com/r/lineageos) and provide a recovery log.

## My device _is_ officially supported, but there's no zips for it on the download page. Where are they?
 - Be patient. Devices are slowly being built throughout the week. Maintainers have busy lives, and sometimes an issue is holding it back. Please do not ask for ETAs.

## My device is _not_ officially supported, but I'd really like to give LineageOS a try. Can you support my device?
 - All devices are maintained by open source contributors - [sorry, we don't take device requests]({{ "device_requests.html" | relative_url }}). If you would like to bring-up LineageOS for a device, and can meet some basic standards, we'll happily look into making it official.
 - If you have a working device tree/kernel, and would like to submit it for official builds, please contact [devrel@lineageos.org](mailto:devrel@lineageos.org) with links to them. Please note - your device **must** have full hardware support (i.e., every peripheral works) and **must** be stable.

## My device is _not_ on the device list, but it is just the same as that other model. Can I use it?
 - If your device is not listed, it's not supported.
 - "The same" is not "equal" which means it needs a separate build

## The list of supported models for my device doesn't contain a specific one I need. Can I still use it?
 - We try to have the list as complete as possible. If yours isn't there it will either not work or we couldn't test it

## A build for my device disappeared? Where'd it go?
 - Occasionally a build is broken. If this happens, we remove it until the next build cycle. It is also possible the device is no longer in the official build roster and its old builds are being purged, or that the version it supported is no longer supported. You can check your device's wiki page to confirm support status.

## Where can I find the last build for _xxx_ device before support was dropped or its LineageOS version was deprecated?
 - In short, you can't. We don't build more than 2 versions usually (excemptions were made when [major hurdles](https://lineageos.org/Changelog-27/#deprecations) prevented a large amount of devices to receive a newer version) and we don't keep old builds around for a multitude of reasons, the largest being that we won't keep old, insecure, potentially broken builds around. Additionally, we don't have the server space (or the space on mirrors) to do so.

## I found a bug. What do I do?
 - You can report it! Please _carefully_ read the [How to submit a bug]({{ "how-to/bugreport" | relative_url }}) page before reporting it.

## Can I have _xxx_ feature added?
 - Don't ask.

## My device doesn't pass SafetyNet!
 - Some devices pass their bootloader unlock status and verity status to android's kernel during boot. We don't purposefully remove those flags, as it isn't our place to lie about security features. There's also a [blog post](https://www.lineageos.org/Safetynet/) about this topic, which explains our reasons further.

## Will you enable signature spoofing?
 - Once again, it isn't our place to lie about security features. No.

## Where does the updater app store the downloaded zip?
 - `/data/lineageos_updates/`

## Mirrors? Why don't you use torrents? Or IPFS? Or carrier pigeons?
 - This question isn't new. To list a few reasons:
   - A majority of builds are downloaded on mobile devices via our updater. Mobile devices have limited bandwidth and monthly quotas.
   - Bandwidth is plentiful for open source projects. We have roughly 100gbit available to us.
   - We occasionally need to remove a build because of a device-breaking bug. This is much harder, or impossible, to accomplish with torrents.
   - We currently keep the last 4 builds per device. Older builds do not have the latest security patches.
   - The top 5 devices account for 50% of our users. 95% of our builds do not have enough users to justify torrents.
   - Pigeons are slow and stupid. They also tend to be hit by vehicles and make a delicious treat for predators. We could send your build via pigeon, but chances are very slim it would make it to you.

## Can/should I relock my bootloader?
 - Few devices allow for it and even less work properly after that. Relocking can result in actual unusable devices, so be warned!

## I have relocked my bootloader and can't get my device to work anymore. What now?
 - Sorry, as per [earlier in this FAQ](#canshould-i-relock-my-bootloader), we don't support this usecase and there may not be a good way to recover.
   [XDA](https://www.xda-developers.com), other similar forums or a search engine may be of use.

## Will my device receive the next android version?
 - We can't tell you. "No ETA" includes the "IF", not just the "WHEN"

## I am following a guide/video somewhere on the internet and am stuck, help?
 - We only provide help for officially supported devices for which we provide our own guides. Follow those instead!
 - If you follow the official guide for your device line-by-line and still experience issues, feel free to ask again.

## I read somewhere/was told that you support my device?
 - If it's on [this list]({{ "/devices/" | relative_url }}), we do, otherwise not.

## Does a specific feature or hardware work on my device?
 - All devices must meet our [Device support requirements](https://github.com/LineageOS/charter/blob/master/device-support-requirements.md).
 - If something doesn't work, look into [How to submit a bug]({{ "how-to/bugreport" | relative_url }})

## Does someone else have _this_ issue
 - Finding other people that have your issue, especially on other devices, is not helpful to solving it. Instead, to best help us solve the issue, please report it properly as shown [here]({{ "how-to/bugreport" | relative_url }}).

## Why do you support this old device but not my newer one?
 - Because all maintainers are volunteers doing this in their free time, and someone happened to love this device enough to bring it up and properly support it.

## Where are guides so I can port LineageOS to my unsupported device?
 - There are none
 - See what other, similar devices did to get them to work.

## Can you help me with _this_ mod/software?
 - We can't provide support for any third-party modifications or software since we don't maintain it.
 - Ask whoever provided it to you, because it's their work.
