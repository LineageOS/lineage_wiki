---
sidebar: home_sidebar
title: Quirks - File encryption support
permalink: quirks/fde
search: exclude
toc: false
---

## File encryption support

To read about file encryption in general, see [here](https://source.android.com/docs/security/features/encryption/).
You have been redirected here because LineageOS builds for your device do not support file encryption functions such as FDE (Full Disk Encryption) or FBE (File Based Encyrption).

### Why is that?

While encryption in Android certainly is standardized, some vendors have their own implementation, which is not open-sourced and can therefore not be integrated into LineageOS' code.
These vendor implementations are often functional on the file-encryption type they shipped with, but for example, on Android 13, AOSP dropped FDE entirely, meaning that any vendor implementation that expects FDE to be utilized will likely not work with FBE, meaning encryption cannot be supported on LineageOS' builds.
This might or might not affect you, depending on your usecase.
