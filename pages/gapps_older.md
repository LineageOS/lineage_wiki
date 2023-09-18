---
sidebar: home_sidebar
title: Google apps for older versions
permalink: gapps/old
---

## Note regarding Open GApps

{% include alerts/important.html content="This only applies if Open GApps is listed as the GApps package for your Android version in the link column of the tables below in the 'Downloads' section. If Open GApps is not listed for your Android version, it is **not recommended**." %}

If you use Open GApps, they offer a variety of sizes of packages that include and overwrite different apps.

Since you can install any non included apps later, we only recommend the following package sizes (or smaller):
 - For mobile devices: `nano`, as described in [Open GApps Package Comparison](https://github.com/opengapps/opengapps/wiki/Package-Comparison).
 - For Android TV: `tvstock`, as described in [Open GApps TVStock Package Listing](https://github.com/opengapps/opengapps/wiki/TVStock-Package).

If you use a larger package, **we can not guarantee** that everything will function on your device, as in many of these cases our included apps are overwritten in favor of the Google App equivalents.
If your device states that there is not enough space on any specific partition during install, you will need to use an even smaller package instead.


## Downloads

These packages are only dependent on your OS version and architecture, which can be found on each device specific info page in this wiki ([Device overview]({{ "devices/" | relative_url }})).

### Mobile

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|LineageOS 17.1 (Android 10)|MindTheGapps ([ARM](https://github.com/MindTheGapps/10.0.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/10.0.0-arm64/releases/latest))|
|LineageOS 16.0 (Android 9.0)|MindTheGapps ([ARM](https://github.com/MindTheGapps/9.0.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/9.0.0-arm64/releases/latest), [x86](https://github.com/MindTheGapps/9.0.0-x86/releases/latest))|
|LineageOS 15.1 (Android 8.1)|MindTheGapps ([ARM](https://github.com/MindTheGapps/8.1.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/8.1.0-arm64/releases/latest), [x86](https://github.com/MindTheGapps/8.1.0-x86/releases/latest))|
|LineageOS 14.1 (Android 7.1)|[Open GApps](https://opengapps.org/?api=7.1&variant=nano)|
|LineageOS 13.0 (Android 6.0)|[Open GApps](https://opengapps.org/?api=6.0&variant=nano)|
{: .table }

### Android TV

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|LineageOS 17.1 (Android 10)|[Open GApps](https://opengapps.org/?api=10.0&variant=tvstock)|
|LineageOS 16.0 (Android 9.0)|[Open GApps](https://opengapps.org/?api=9.0&variant=tvstock)|
|LineageOS 15.1 (Android 8.1)|MindTheGapps ([ARM](https://github.com/MindTheGapps/8.1.0-arm-ATV/releases/latest), [ARM64](https://github.com/MindTheGapps/8.1.0-arm64-ATV/releases/latest), [x86](https://github.com/MindTheGapps/8.1.0-x86-ATV/releases/latest))|
|LineageOS 14.1 (Android 7.1)|[Open GApps](https://opengapps.org/?api=7.1&variant=tvstock)|
|LineageOS 13.0 (Android 6.0)|[Open GApps](https://opengapps.org/?api=6.0&variant=tvstock)|
{: .table }
