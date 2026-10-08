---
sidebar: home_sidebar
title: microG
permalink: /microg/
---

## What is microG?

[microG](https://github.com/microg/GmsCore/wiki/) is a free software reimplementation of Google's Play Services. It allows applications calling proprietary Google APIs to run on AOSP-based ROMs like LineageOS, acting as a free replacement for the non-free, proprietary Google Play Services (GApps). It allows you to enjoy core Android features, without having to install proprietary Google packages.

{% include alerts/note.html content="Apps that take advantage of microG may still be using proprietary libraries to communicate with microG, just as they do when communicating with the actual Google Play Services." %}

## Installation

1. Download **microG Services (GmsCore)** and **microG Companion (FakeStore)** from [microG Downloads](https://github.com/microg/GmsCore/wiki/Downloads).
2. Install the downloaded APKs.
3. Open **microG Settings** and complete the **Self-Check** checklist to grant all requested permissions.

## Google Cloud Messaging (GCM)

Google Cloud Messaging delivers push notifications from app servers to the device without the app needing to run in the background.

### Why enable Google Cloud Messaging (GCM)
Without GCM, apps cannot receive push notifications unless they run persistent background services, which significantly degrades battery life and may lead to delayed or missed alerts.

### How to enable GCM
1. Open **microG Settings**.
2. Select **Google device registration** and toggle it **On**.
3. Select **Cloud Messaging** and toggle it **On**.
4. In **Cloud Messaging** > Tap on 3 dots at top right corner > **Advanced**, configure ping intervals if push notifications are delayed on cellular or Wi-Fi networks.
5. GCM is now enabled and it will be used automatically for all installed apps.

## Network Location Provider (NLP)

Network location provides location services through Wi-Fi and cell tower positioning without relying on Google's location servers. GPS alone can be slow to acquire a fix indoors or in dense urban areas. NLP provides fast, low-power approximate location fixes for applications by using alternative location services.

### How to enable NLP
1. Open **microG Settings** > **Location**.
2. Tap on 3 dots at top right corner.
3. Select **Online Location Service**.
4. Select a location provider service.

## microG Services Framework Proxy (GsfProxy)

Legacy apps that use older Google Cloud Messaging implementations will require **microG Services Framework Proxy (GsfProxy)** to communicate with microG. Modern apps will not require this package, so in most cases, you will not need to install it.

Installing the APK directly will fail, as it targets a lower SDK version than Android 14+. In order to bypass this restriction, you can sideload the APK from your computer using `adb`.

To install GsfProxy on LineageOS:

1. Make sure you have [`adb` set up]({{ "adb_fastboot_guide" | relative_url }}) on your computer.
2. Download `GsfProxy.apk` from the [microG Downloads](https://github.com/microg/GsfProxy/releases/latest) page onto your computer.
3. Enable **USB debugging** on your device in **Settings** > **Developer options**.
4. Connect your device to your computer via USB.
5. Run the following command in a terminal to bypass the minimum target SDK restriction:
   ```bash
   adb install --bypass-low-target-sdk-block GsfProxy.apk
   ```
