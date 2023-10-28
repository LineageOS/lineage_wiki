---
sidebar: home_sidebar
title: Quirks - Device integrity
permalink: quirks/snet
toc: false
---

## Device integrity

By design LineageOS does not intentionally circumvent any integrity checks that app developers might use such us:
* [Play Integrity](https://developer.android.com/google/play/integrity/overview)
* [SafetyNet](https://developer.android.com/privacy-and-security/safetynet)

Therefore, any apps that depend on some kind of device integrity checks passing, will not work on LineageOS, and while there might be some ways to bypass these checks, we neither support nor endorse any of them.
