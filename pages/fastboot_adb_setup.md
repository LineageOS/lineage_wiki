---
sidebar: home_sidebar
title: Using ADB and fastboot
permalink: adb_fastboot_guide.html
---
## What is `adb`?
The [Android Debug Bridge](https://en.wikipedia.org/wiki/Android_Debug_Bridge) (`adb`) is a development tool that facilitates communication between an Android
device and a personal computer. This communication is most often done over a USB cable, but Wi-Fi
connections are also supported.

`adb` is like a "Swiss-army knife" of Android development. It provides numerous functions that are
described in detail by the command `adb --help`. Some of the more commonly used
commands are listed in the "[popular adb commands](#popular-adb-commands)" section below.

## Installing `adb` and `fastboot`

Google hosts zips including only `adb` and `fastboot`. You can set these up for use with the instructions below.

### On Windows
1. Download the [Windows zip](https://dl.google.com/android/repository/platform-tools-latest-windows.zip) from Google.
2. Extract it somewhere - for example, `%USERPROFILE%\adb-fastboot`
3. On Windows 7/8:
    * From the desktop, right-click My Computer and select Properties
    * In the System Properties window, click on the Advanced tab
    * In the Advanced section, click the Environment Variables button
    * In the Environment Variables window, highlight the Path variable in the Systems Variable section and click the Edit button
    * Append `;%USERPROFILE%\adb-fastboot\platform-tools` to the end of the existing Path definition (the semi-colon separates each path entry)
4. On Windows 10:
    * Open the Start menu, and type "advanced system settings"
    * Select "View advanced system settings"
    * Click on the Advanced tab
    * Open the "Environment Variables" window
    * Select the Path variable under "System Variables" and click the "Edit" button
    * Click the "New" button
    * Insert `%USERPROFILE%\adb-fastboot\platform-tools` in the text field
5. Download the [usb drivers](https://developer.android.com/studio/run/win-usb) and follow the instructions there.

### On macOS
1. Download the [macOS zip](https://dl.google.com/android/repository/platform-tools-latest-darwin.zip) from Google.
2. Extract it somewhere - for example, `~/adb-fastboot`.
3. Add the following to `~/.bash_profile` if you are using Bash or `~/.zshenv` if you are using Z shell:
```sh
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
    export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
```
4. Log out and back in.

### On Linux
1. Download the [Linux zip](https://dl.google.com/android/repository/platform-tools-latest-linux.zip) from Google.
2. Extract it somewhere - for example, `~/adb-fastboot`.
3. Add the following to `~/.profile`:
```sh
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
    export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
```
4. Log out and back in.
5. You may also need to set up udev rules: see [this repository](https://github.com/M0Rf30/android-udev-rules#installation) for more info.

## Setting up `adb`

To use `adb` with your device, you'll need to enable developer options and USB debugging:

1. Open Settings, and select "About".
2. Tap on "Build number" seven times.
3. Go back, and select "Developer options".
4. Scroll down, and check the "Android debugging" or "USB debugging" entry under "Debugging".
5. Plug your device into your computer.
6. On the computer, open up a terminal/command prompt and type `adb devices`.
7. A dialog should show on your device, asking you to allow usb debugging. Check "always allow", and choose "OK".\\
   If the dialog is not appearing or the list of devices is empty, check if you installed `adb` properly.
  * On Windows: Make sure your device manager does show your phone and doesn't show a yellow triangle next to it!

Congratulations! `adb` is now ready to use with your device.

## Setting up `fastboot`

Using `fastboot` (if your device supports it) should simply involve rebooting to fastboot mode.
While in fastboot mode, you can type `fastboot devices` to verify that your device is being detected.

## Popular `adb` commands

* `adb shell` - launches a [shell](https://en.wikipedia.org/wiki/Shell_(computing)) on the device
* `adb push <local> <remote>` - pushes the file `<local>` to `<remote>`
* `adb pull <remote> [<local>]` - pulls the file `<remote>` to `<local>`. If `<local>` isn't specified,
it will pull to the current folder.
* `adb logcat` - allows you to view the device log in real-time. You can use `adb logcat -b radio` to view radio logs,
and `adb logcat -C` to view logs in colour
* `adb install <file>` - installs the given .apk file to your device

## Need help?

You can find assistance with LineageOS on [our subreddit](https://reddit.com/r/LineageOS), or in [#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).
