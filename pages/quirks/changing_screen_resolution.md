---
sidebar: home_sidebar
title: Quirks - Changing Screen Resolution
permalink: quirks/changing_screen_resolution/
robots: noindex
search: exclude
toc: false
---

## Changing Screen Resolution

Prior to Linux 4.19, Android did not include a standardized method for changing screen resolutions. As a result, each vendor implemented the feature independently — often in fragmented and unsustainable ways, making the function difficult to support on this device while running LineageOS.

### Why Is That?

On older kernels before 4.19, this function is broken and each OEM made its own implementation on Android side.
This means that your device will utilize the highest supported resolution, and may not properly support any lower resolutions that the stock ROM exposed.
