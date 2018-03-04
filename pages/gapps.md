---
sidebar: home_sidebar
title: Google apps
permalink: gapps.html
---
Google apps are the proprietary Google-branded applications that come pre-installed with most Android devices, such as the Play Store, Gmail, Maps, etc.
Due to licensing restrictions, these apps cannot come pre-installed with LineageOS and must be installed separately. The Google apps are not required to
boot or run LineageOS, however many users find them beneficial to take full advantage of the Android ecosystem.

These apps have been packaged by developers independent of LineageOS, and download links have been provided for your convenience only. It is possible to perform
a "backup" of the Google apps on your device and then "restore" them, but this does take additional steps which are not covered here.

The Google apps packages are **not supported** in any way by LineageOS.

## Downloads

These packages are only dependent on your OS version and architecture, which can be found on each device specific info page in this wiki ([Device overview](devices.html)).

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|Lineage 15.1 (Android 8.1)|[MindTheGapps](http://downloads.codefi.re/jdcteam/javelinanddart/gapps) [(mirror)](https://androidfilehost.com/?w=files&flid=170282), [OpenGApps](http://opengapps.org/?api=8.1&variant=nano)|
|Lineage 14.1 (Android 7.1)|[OpenGApps](http://opengapps.org/?api=7.1&variant=nano)|
|Lineage 13.0 (Android 6.0)|[OpenGApps](http://opengapps.org/?api=6.0&variant=nano)|

## Installation

Google apps should be installed via recovery **immediately** after installing LineageOS. Exact steps vary, but the process is similar to that of installing LineageOS:

{% include important.html content="If you reboot into LineageOS before installing Google apps, you must factory reset and then install them, otherwise expect crashes." %}

1. Copy the Google apps zipfile to `/sdcard/`
    * Using [adb](adb_fastboot_guide.html): `adb push filename.zip /sdcard/`
2. After installing LineageOS, choose "install zip" or "Apply update" in recovery, and navigate to the zipfile loaded earlier.
3. Reboot to system (i.e. LineageOS).
