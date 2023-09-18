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

If you choose to install Google apps they must be installed via recovery **immediately** after installing LineageOS. Exact steps vary, and as such, you should see your device's installation guide [here]({{ "devices/" | relative_url }}) for specific instructions.

{% include alerts/important.html content="If you reboot into LineageOS before installing Google apps, you must factory reset and then install them, otherwise expect crashes.<br/>
This also applies when you experience issues and want to try an older or other package of these apps." %}

## Downloads

These packages are only dependent on your OS version and architecture, which can be found on each device specific info page in this wiki ([Device overview]({{ "devices/" | relative_url }})).

{% include alerts/note.html content="Filenames of MindTheGapps are of the format `MindTheGapps-<AndroidVersion>-<architecture>-<date>_<time>.zip` (with Android 12L being 12.1), choose carefully!" %}

{% include alerts/warning.html content="Users often experience issues when deviating from the packages listed below. Be warned!" %}

### Mobile

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|LineageOS 20 (Android 13)|MindTheGapps ([ARM](https://github.com/MindTheGapps/13.0.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/13.0.0-arm64/releases/latest))|
|LineageOS 19 (Android 12L)|MindTheGapps ([ARM](https://github.com/MindTheGapps/12.1.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/12.1.0-arm64/releases/latest))|
|LineageOS 18.1 (Android 11)|MindTheGapps ([ARM](https://github.com/MindTheGapps/11.0.0-arm/releases/latest), [ARM64](https://github.com/MindTheGapps/11.0.0-arm64/releases/latest))|
|Older versions|[See here](gapps/old.html)|
{: .table }

### Android TV

|Version                   |Link                                                   |
|--------------------------|-------------------------------------------------------|
|LineageOS 20 (Android 13)|MindTheGapps ([ARM](https://github.com/MindTheGapps/13.0.0-arm-ATV/releases/latest), [ARM64](https://github.com/MindTheGapps/13.0.0-arm64-ATV/releases/latest))|
|LineageOS 19 (Android 12L)|MindTheGapps ([ARM](https://github.com/MindTheGapps/12.1.0-arm-ATV/releases/latest), [ARM64](https://github.com/MindTheGapps/12.1.0-arm64-ATV/releases/latest))|
|LineageOS 18.1 (Android 11)|MindTheGapps ([ARM](https://github.com/MindTheGapps/11.0.0-arm-ATV/releases/latest), [ARM64](https://github.com/MindTheGapps/11.0.0-arm64-ATV/releases/latest))|
|Older versions|[See here](gapps/old.html)|
{: .table }
