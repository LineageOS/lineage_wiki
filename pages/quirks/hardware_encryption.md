---
sidebar: home_sidebar
title: Quirks - Hardware Backed Encryption
permalink: quirks/hardware_encryption
toc: false
---

## Hardware Backed Encryption

To read about Hardware Backed Encryption in general, see [here](https://source.android.com/docs/security/features/keystore).
You have been redirected here because LineageOS builds for your device do not support hardware backed encryption, but does support software backed encryption.

### Why is that?

While it certainly standardized, vendors have their own implementation at a firmware level, which is not open-source and can therefore not be integrated into LineageOS' code.
Devices utilizing these implementations therefore do not support hardware backed encryption, but do support software backed encyrption.
This might or might not affect you, depending on your encryption needs, as software backed encryption has a notable performance impact whereas hardware backed encryption does not.
