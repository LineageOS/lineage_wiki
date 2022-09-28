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


## Installation

Google apps should be installed via recovery **immediately** after installing LineageOS. Exact steps vary, and as such, you should see your device's installation guide [here]({{ "devices/" | relative_url }}) for specific instructions.

{% include alerts/important.html content="If you reboot into LineageOS before installing Google apps, you must factory reset and then install them, otherwise expect crashes.<br/>
This also applies when you experience issues and want to try an older or other package of these apps." %}

### Note regarding Open GApps

{% include alerts/important.html content="This only applies if Open GApps is listed as the GApps package for your Android version in the link column of the tables below in the 'Downloads' section. If Open GApps is not listed for your Android version, it is **not recommended**." %}

If you use Open GApps, they offer a variety of sizes of packages that include and overwrite different apps.

Since you can install any non included apps later, we only recommend the following package sizes (or smaller):
 - For mobile devices: `nano`, as described in [Open GApps Package Comparison](https://github.com/opengapps/opengapps/wiki/Package-Comparison).
 - For Android TV: `tvstock`, as described in [Open GApps TVStock Package Listing](https://github.com/opengapps/opengapps/wiki/TVStock-Package).

If you use a larger package, **we can not guarantee** that everything will function on your device, as in many of these cases our included apps are overwritten in favor of the Google App equivalents.
If your device states that there is not enough space on any specific partition during install, you will need to use an even smaller package instead.


## Downloads

These packages are only dependent on your OS version and architecture, which can be found on each device specific info page in this wiki ([Device overview]({{ "devices/" | relative_url }})).

{% include alerts/note.html content="Filenames on MindTheGapps are of the format `MindTheGapps-<AndroidVersion>-<architecture>-<date>_<time>.zip` (with Android 12L being 12.1), choose carefully!" %}

{% include alerts/warning.html content="Users often experience issues when deviating from the packages listed below. Be warned!" %}

### Mobile

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|Lineage 17.1/18.1/19 (Android 10/11/12L)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=322935) ([mirror](http://downloads.codefi.re/jdcteam/javelinanddart/gapps))|
|Lineage 15.1/16.0 (Android 8.1/9.0)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=170282) ([mirror](http://downloads.codefi.re/jdcteam/javelinanddart/gapps))|
|Lineage 14.1 (Android 7.1)|[Open GApps](https://opengapps.org/?api=7.1&variant=nano)|
|Lineage 13.0 (Android 6.0)|[Open GApps](https://opengapps.org/?api=6.0&variant=nano)|
{: .table }

### Android TV

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|Lineage 19 (Android 12L)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=334254) ([mirror](http://downloads.codefi.re/jdcteam/javelinanddart/gapps/ATV))|
|Lineage 18.1 (Android 11)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=334254) ([mirror](http://downloads.codefi.re/jdcteam/javelinanddart/gapps/ATV))|[Open GApps](https://opengapps.org/?api=11.0&variant=tvstock)|
|Lineage 17.1 (Android 10)|[Open GApps](https://opengapps.org/?api=10.0&variant=tvstock)|
|Lineage 16.0 (Android 9.0)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=170282)|
|Lineage 15.1 (Android 8.1)|[MindTheGapps](https://androidfilehost.com/?w=files&flid=170282) ([mirror](http://downloads.codefi.re/jdcteam/javelinanddart/gapps/old))|
|Lineage 14.1 (Android 7.1)|[Open GApps](https://opengapps.org/?api=7.1&variant=tvstock)|
|Lineage 13.0 (Android 6.0)|[Open GApps](https://opengapps.org/?api=6.0&variant=tvstock)|
{: .table }
