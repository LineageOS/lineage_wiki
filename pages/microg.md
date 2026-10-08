---
sidebar: home_sidebar
title: microG
permalink: /microg/
---

## What is microG?

[microG](https://github.com/microg/GmsCore/wiki/) is a free software reimplementation of Google's Play Services. It allows applications calling proprietary Google APIs to run on AOSP-based ROMs like LineageOS, acting as a free replacement for the non-free, proprietary Google Play Services (sometimes referred to as the more generic term "GApps"). It is a powerful tool to reclaim your privacy and freedom while enjoying Android core features (although apps you use that take advantage of it may still be using proprietary libraries to communicate with microG, just as they do when communicating with the actual Google Play Services).

## Installation

### microG Services (GmsCore) and microG Companion (FakeStore)
microG can be installed as standalone applications after native support was added in LineageOS.

1. Download **microG Services (GmsCore)** and **microG Companion (FakeStore)** from [microG Downloads](https://github.com/microg/GmsCore/wiki/Downloads).
2. Install the downloaded APKs.
3. Open **microG Settings** and complete the **Self-Check** checklist to grant all requested permissions (such as battery optimization ignore and location).

### microG Services Framework Proxy (GsfProxy)

Legacy apps that use older Google Cloud Messaging implementations require **microG Services Framework Proxy (GsfProxy)** to communicate with microG. Newer apps that communicate directly with **microG Services (GmsCore)** don't need it which is the case with modern apps. In most cases, you will not need it, but if you want to install it. Installing directly will fail because it targets lower SDK version which blocks its installation via sideload on Android 14+.

To install GsfProxy on LineageOS:

1. Download `GsfProxy.apk` from the [microG Downloads](https://github.com/microg/GsfProxy/releases/latest) page onto your computer.
2. Enable **USB debugging** on your device in **Settings** > **Developer options**.
3. Connect your device to your computer via USB.
4. Run the following command in a terminal to bypass the minimum target SDK restriction:
   ```bash
   adb install --bypass-low-target-sdk-block GsfProxy.apk
   ```

## Google Cloud Messaging (GCM)

Google Cloud Messaging delivers push notifications from app servers to the device without needed for the app to run in the background.
This feature helps apps to not run all time for delivering notifications.

### Why Enable Google Cloud Messaging  (GCM)
Without GCM, Apps cannot receive push notifications unless they run persistent background services, which significantly degrades battery life and may lead to delayed or missed alerts.

### How to Enable GCM
1. Open **microG Settings**.
2. Select **Google device registration** and toggle it **On**.
3. Select **Cloud Messaging** and toggle it **On**.
4. In **Cloud Messaging** > **Click on 3 dots in top right corner** > **Advanced**, configure ping intervals if push notifications are delayed on cellular or Wi-Fi networks.
5. GCM is now enabled and it will be used for apps which you will install or are installed.

## Network Location Provider (NLP)

Network location provides location services through Wi-Fi and cell tower positioning without relying on Google location servers.
GmsCore includes the Unified Network Location Provider module (UnifiedNlp) which handles application calls to Google's network location provider.

### Why Enable NLP
GPS alone can be slow to acquire a fix indoors or in dense urban areas. NLP provides fast, low-power approximate location fixes for applications.

### How to Enable NLP
1. Open **microG Settings** > **Location**.
2. Tap on 3 dots in top right corner.
3. Select Online Location Service.
4. Select Service.
