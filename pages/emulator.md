---
sidebar: home_sidebar
title: Building for Emulator/AVD
permalink: emulator.html
---

## Introduction

In case you don't have an officially supported device, don't want to test changes on your daily driver, or are just someone who wants to test apps with LineageOS-specific features, we've still got you covered.

These instructions will help you build an emulator-compatible version of LineageOS, ready to run on your computer. If you want to use Android Studio/AVD there are also instructions for packing up/installing your
custom build instead of the default AOSP images that Google provides.


{% include templates/device_build_before_init.md %}


### Initialize the LineageOS source repository

The following branches have been tested for building emulator images:

* lineage-16.0
* lineage-17.1
* lineage-18.1

{% assign current_branch = 18.1 %}
{% include templates/device_build_init_sync.md %}

### Start the build

Time to start building! Now, type:

```
source build/envsetup.sh
lunch lineage_<arch>-eng
mka
```

`<arch>` can be one of the following:

* `arm` (32-bit ARM)
* `arm64` (64-bit ARM)
* `x86` (32-bit x86)
* `x86_64` (64-bit x86)

Notably, as of LineageOS 18.1 one can also build Android TV format verions of each arch above, the options for this are as follows:

* `tv_arm` (32-bit ARM)
* `tv_arm64` (64-bit ARM)
* `tv_x86` (32-bit x86)
* `tv_x86_64` (64-bit x86)

For starting, `x86` is recommended, as your computer can run it natively using hardware acceleration.

Instead of `eng` one can also target `userdebug`, the latter is used by official AOSP emulator images, but ADB and communiction with the emulator will need to be enabled first.

## Running the emulator

Assuming the build completed without errors, type the following in the terminal window the build ran in:

```
emulator
```

After a few seconds, the emulator will fire up, and you'll see the LineageOS boot-logo. After some time, it will boot up, and is ready to run,


### Success! So... what's next?

You've done it! Welcome to the elite club of self-builders. You've built your operating system from scratch, from the ground up. You are the master/mistress of your domain... and
hopefully you've learned a bit on the way and had some fun too.


## Exporting for use in Android Studio/AVD

In case you want to run the emulator image independently from the system/terminal you built it in, you are able to export the built image into a format that can be used by Android Studio/AVD.
To do that, run the following command in the same terminal that you originally started the build in:

```
mka sdk_addon
```

If you now look into the `out/host/linux-x86/sdk_addon` directory, you will find a ZIP file (ending in `-img.zip`) that contains all the necessary files for running the emulator image externally.

To deploy the build into your Android Studio installation, move the contained folder (which is named after the architecture that you built for) into a **subfolder** of `/path/to/android/sdk/system-images`.
AOSP uses the following path name by default, but you are free to make up your own as well:

`system-images/android-<sdk version>/<tag>/<arch>` (where `<tag>` is one of `default`/`google_apis`/`google_apis_playstore`)

LineageOS emulator builds will use the tag `lineage` by default (visible as "LineageOS" in the images list).

As long as you **haven't** moved the folder directly into `system-images`, the emulator image should now show up in the of the lists of images when creating a new virtual Android device.

## To get assistance

* [#LineageOS-dev](https://webchat.freenode.net/?channels=lineageos-dev) - A helpful, real-time chat room (or "channel"), on the Freenode [IRC](https://en.wikipedia.org/wiki/Internet_Relay_Chat) network.
