---
sidebar: home_sidebar
title: How to fix provisioning (home button not working and no notifications)
folder: how-tos
permalink: provisioning-howto.html
tags:
 - how-to
---

## Symptoms
  - your phone probably rebooted unexpectedly
  - home button and recent apps button don't work
  - no notifications appear
  - can't access developer options
  - some settings were reset

## Possible causes
  So this happened to me a few times on surnia, mainly when I run out of free storage space but I don't know the exact cause.
  
## How to fix it (requires enabled adb)
  For now the best way I've found to make this work is to use adb:
  - plug in your phone and allow usb debugging
  - open a terminal
  - type in `adb shell`
  - type in the following:
    - `$ settings put global device_provisioned 1`
    - `$ settings put secure user_setup_complete 1`
  - note that it won't bring your reset settings back (screen timeout, ringtone, other minor things) but you'll be able to set those and use your phone normally.
  
## How to fix it when adb is not enabled
  If you don't have adb enabled it might be possible to do the same thing from a bootloader by editing the config files from a bootloader like twrp (If you don't have it installed then [here](https://www.xda-developers.com/how-to-install-twrp/) is a general guide but I recommend searching for a device-specific one.), booting into fastboot, then into recovery and then doing the following things:
  - get a system shell `adb shell`
  - get superuser permissions (if you don't have them already) `su`
  - decrypt the data partition if it's encrypted `twrp decrypt [password]`
  - mount the data partition if it's not mounted (on your phone select mount > check data)
  - edit the file with device_provisioned setting (`vi settings_global.xml`) and find the option device_provisioned. Now, if you've never used vi here's how to do it (type exactly what you see):
    - `/device_provisioned`
    - `5e`
    - `r1`
    - you should now see your cursor blinking in the text value="1"
    - `:wq`
  - edit the second file with user_setup_complete in it `vi settings_secure.xml` and type in the following:
    - `/user_setup_complete`
    - `5e`
    - `r1`
    - you should now see your cursor blinking in the text value="1"
    - `:wq`
  - now you can reboot and reconfigure your phone.

## Other ideas
  I'm not sure if there's more ways to do that but I've found [this stackoverflow question](https://stackoverflow.com/questions/6886244/home-button-doesnt-work-is-it-possible-to-listen) which might help for old versions of android which still use settings.db. Note that you need to change both the user_setup_complete and device_provisioned as opposed to what this person suggests.
