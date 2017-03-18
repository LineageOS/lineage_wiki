---
sidebar: home_sidebar
title: Logcat
permalink: logcat.html
---

## Taking logs for bug reports

### On your device

{% include note.html content="This method requires that your device is [rooted](https://download.lineageos.org/extras)" %}

These instructions will generate a logcat on your sdcard which you can then attach to a bug report on JIRA.

1. Open the Terminal app (you can turn it on in Developer Options)
2. Type `su` and confirm root access - you may have to turn on root access for apps in Developer options.
3. Type `logcat -d -f /sdcard/logcat.txt '*:V'`. This will save your log to `/sdcard/logcat.txt`.
    * Alternatively, the radio buffer can be viewed with `logcat -b radio`.

### With a computer

{% include note.html content="This method requires that you have [adb installed](/adb_fastboot_guide.html#installing-adb-and-fastboot).
If you don't have it installed, please do that before continuing." %}

1. Open Command Prompt (Windows) or Terminal (Linux/macOS)
2. Type `adb logcat -d '*:V' > logcat.txt`. This will save your log to `logcat.txt`.
    * Alternatively, the radio buffer can be viewed with `logcat -b radio`.

