---
sidebar: home_sidebar
title: How to connect to adb over wifi
folder: how-tos
permalink: /how-to/adb-over-wifi
tags:
 - how-to
---

In some cases it might be required to get adb access to your device without plugging in a cable:
  - Charging port is in bad shape
  - The data cable is broken
  - The cable is in another room and you are a couch-potato
  - ...

{% include alerts/important.html content="Make sure no device is connected to your computer via cable,
otherwise any command used after connection won't get through to the correct device" %}


## For your device running LineageOS 18.1+

### On your device

1. Go to the developer settings
2. Press `Enable Wireless debugging`
3. Select `Pair device with pairing code`

You will see a dialog showing you IP address, port and a code.

### On your computer

1. Open a command line window
2. Type `adb pair <ip>:<port>` and replace `<ip>` and `<port>` with the data seen on the device
3. You will be asked for the pairing code. Type it in and hit <key>Enter</key>
4. You will now see an output similar to
```Successfully paired to <ip>:<port>```
5. To connect to the device, type `adb connect <ip>:<port>` and replace `<ip>` and `<port>` with the data seen on the Wireless debugging page after closing the pairing dialog

Additionally you will get a notification on your device.

{% include alerts/note.html content="This method is supported natively since Android 11." %}


## For your device running LineageOS 17.1 or lower

### On your device

1. Pull down the status bar menu (full expansion)
2. Press the small pencil-icon to edit your QS tile
3. Find the "Adb over Network" tile and drag it to the area on top
4. Connect to the same wifi network as your computer
5. Activate the tile by pressing it once

You will now see the device's IP address below the tile which you'll need for the next step

### On your computer

1. Open a command line window
2. Type `adb connect <ip>:5555` and replace `<ip>` with the one you see on the QS tile
3. You will get an output similar to
```connected to <ip>:5555```

To disconnect, you simply type `adb disconnect`.
Please note that after a command that might interrupt the connection, like `adb root` you need
to disconnect and reconnect using the commands above before you can successfully communicate with
the device again.

