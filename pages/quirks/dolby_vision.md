---
sidebar: home_sidebar
title: Quirks - Dolby Vision
permalink: quirks/dolby_vision/
robots: noindex
search: exclude
toc: false
---

## Dolby Vision

You have been redirected here because LineageOS builds for your device do not support Dolby Vision, or local Dolby content decoding.

### Why is that?

This feature is heavily proprietary and guarded to only function on devices running the stock ROM with the bootloader locked.

This is a proprietary feature implemented in the closed-source NVIDIA frameworks. It is additionally protected by a Trusted Execution Environment (TEE) function called `ipprotect` encryption that further complicates OSS support of the feature.