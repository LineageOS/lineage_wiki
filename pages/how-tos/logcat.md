---
sidebar: home_sidebar
title: How to capture logs
folder: how-tos
redirect_from: logcat.html
permalink: /how-to/logcat
tags:
 - how-to
---

## Taking logs for bug reports

These instructions will generate a `logcat` file which you can then attach to a [bug report](bugreport#reporting-a-bug).
That file basically consists of a log of system messages, including stack traces when the device throws an error, and debug messages from apps.

### With a computer

{% capture content -%}
This method requires that you have [`adb` installed]({{ site.baseurl }}/adb_fastboot_guide.html#installing-adb-and-fastboot).
If you don't have it installed, please do that before continuing.
{% endcapture -%}

{% include alerts/note.html content=content %}

1. Open Command Prompt (Windows) or Terminal (Linux/macOS).
2. Connect your device via cable or [over WiFi](adb-over-wifi)
3. Type `adb logcat -d > logcat.txt`. This will save the log to `logcat.txt`.

   Additionally, the radio buffer can be viewed or stored with `logcat`. If needed or requested, type `adb logcat -db radio > radio.txt` to save it to `radio.txt`.
