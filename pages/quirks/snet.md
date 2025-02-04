---
sidebar: home_sidebar
title: Quirks - Device integrity
permalink: quirks/snet/
toc: false
---

## Device integrity

By design LineageOS [does not intentionally circumvent](https://github.com/LineageOS/charter/blob/main/device-support-requirements.md#play-integrity) any integrity checks that app developers might use, such as:
* [Play Integrity](https://developer.android.com/google/play/integrity/overview)
* [SafetyNet](https://developer.android.com/privacy-and-security/safetynet) (deprecated)

Therefore, any apps that depend on some kind of device integrity checks passing, will not work on LineageOS, and while there might be some ways to bypass these checks, we neither support nor endorse any of them.

If you have further doubts on circumvention of Play Integrity, we have a [blog post](https://www.lineageos.org/PlayIntegrity/) which explains further.
