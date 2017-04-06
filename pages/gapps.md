---
sidebar: home_sidebar
title: Google apps
permalink: gapps.html
---
Google apps are the proprietary Google-branded applications that come pre-installed with most Android devices, such as the Play Store, Gmail, Maps, etc.
Due to licensing restrictions, these apps cannot come pre-installed with LineageOS and must be installed separately. The Google apps are not required to
boot or run LineageOS, however many users find them beneficial to take full advantage of the Android ecosystem.

These apps have been packaged by a developer independent of LineageOS, and download links have been provided for your convenience only. It is possible to perform
a "backup" of the Google apps on your device and then "restore" them, but this does take additional steps which are not covered here.

The Google apps packages are **not supported** in any way by LineageOS.

## Downloads

These packages are only dependent on your OS version and architecture, which can be found on each device specific info page in this wiki ([Device overview](devices.html)).

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|Lineage 14.1 (Android 7.1)|[Delta Gapps](https://forum.xda-developers.com/android/software/app-minimal-gapps-gapps-lp-20150107-1-t2997368)|
|Lineage 13.0 (Android 6.0)|[Delta Gapps](https://forum.xda-developers.com/android/software/app-minimal-gapps-gapps-lp-20150107-1-t2997368)|

## Installation

Google apps should be installed via recovery _immediately_ after installing LineageOS. Exact steps vary, but the process is similar to that of installing LineageOS:

{% include important.html content="If you reboot into LineageOS before installing Google apps, you must factory reset and then install them, otherwise expect crashes." %}

1. Copy the Google apps zipfile to `/sdcard/`
    * Using [adb](adb_fastboot_guide.html): `adb push filename.zip /sdcard/`
2. After installing LineageOS, choose "install zip" or "Apply update" in recovery, and navigate to the zipfile loaded earlier.
3. Reboot back in to Android
