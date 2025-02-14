---
sidebar: home_sidebar
title: Quirks - AI Upscaling
permalink: quirks/ai_upscaling/
robots: noindex
search: exclude
toc: false
---

## AI Upscaling

You have been redirected here because LineageOS builds for your device do not support the AI upscaling features that the stock ROM supports.

AI upscaling utilizing DLSS amongst other components to take lower resolution content and upscale it to 4k.

For more information on this feature see [here[(https://www.nvidia.com/en-us/shield/support/shield-tv/ai-upscaling/).

### Why is that?

This is a proprietary feature implemented in the closed-source NVIDIA frameworks.

Additionally, it is protected by a Trusted Execution Environment (TEE) function called `ipprotect` encryption that further complicates OSS support of the feature.