---
sidebar: home_sidebar
title: Google apps
permalink: gapps.html
---
Google apps are the proprietary Google-branded applications that come pre-installed with most Android devices, such as the Play Store, Gmail, Maps, etc.
Due to licensing restrictions, these apps cannot come pre-installed with LineageOS and must be installed separately. The Google apps are not required to
boot or run LineageOS, however many users find them beneficial to take full advantage of the Android ecosystem.

These apps have been packaged by a developer independent of LineageOS, and download links have been provided for your convenience. It is possible to perform
a "backup" of the Google apps on your device and then "restore" them, but this does take additional steps which are not covered here.

The Google apps packages are NOT SUPPORTED in any way by LineageOS.

## Downloads

These packages are DPI-independent, so you only need to match your OS version and architecture.

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|Lineage 14.1 (Android 7.1)|[OpenGApps](http://opengapps.org/?api=7.1&variant=nano)|
|Lineage 13.0 (Android 6.0)|[OpenGApps](http://opengapps.org/?api=6.0&variant=nano)|

## Installation

Google apps should be installed via recovery immediately after installing LineageOS. Exact steps vary, but the process is similar to that of installing LineageOS:

{% include note.html content="If you reboot into LineageOS before installing Google apps, you must factory reset and then install them." %}

1. Copy the Google apps zipfile to `/sdcard/`
    * Using [adb](adb_fastboot_guide.html): `adb push filename.zip /sdcard/`
2. After installing LineageOS, choose "install zip" or "Apply update" in recovery, and navigate to the zipfile loaded earlier.
3. Reboot back in to Android
