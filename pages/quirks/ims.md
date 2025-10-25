---
sidebar: home_sidebar
title: Quirks - IMS
permalink: quirks/ims/
robots: noindex
search: exclude
toc: false
---

## IMS

To read about IMS in general, see [here](https://en.wikipedia.org/wiki/IP_Multimedia_Subsystem).
You have been redirected here because LineageOS builds for your device do not support IMS functions.

### Why is that?

While it certainly is a standard, there is no standard implementation for it in the Android source code.
Some vendors have their own implementation, which is not open-source and can therefore not be integrated into LineageOS' code.
Devices that rely on any of these implementations therefore lack all the features provided by IMS ([VoLTE](https://en.wikipedia.org/wiki/Voice_over_LTE), [VoWi-Fi](https://en.wikipedia.org/wiki/Wi-Fi_calling), [VoNR](https://en.wikipedia.org/wiki/Voice_over_NR), etc.).
This might or might not affect you, depending on your provider and region.
