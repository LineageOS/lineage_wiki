---
sidebar: home_sidebar
title: Building for Emulator/AVD
permalink: emulator.html
---

## Introduction

In case you don't have an officially supported device, don't want to test changes on your daily driver, or are just someone who wants to test apps with LineageOS-specific features, we've still got you covered.

These instructions will help you build an emulator-compatible version of LineageOS, ready to run on your computer. If you want to use Android Studio/AVD there are also instructions for packing up/installing your
custom build instead of the default AOSP images that Google provides.


### What you'll need

* A relatively recent 64-bit computer (Linux, macOS, or Windows) with a reasonable amount of RAM and about 200 GB of free storage (more if you enable `ccache`
 or build for multiple devices). The less RAM you have, the longer the build will take. Aim for 16 GB RAM or more, enabling ZRAM can be helpful. Using SSDs results in considerably faster
 build times than traditional hard drives.
* A decent internet connection and reliable electricity. :)
* Some familiarity with basic Android operation and terminology.
 It may be useful to know some basic command line concepts such as `cd`, which stands for “change directory”, the concept of directory hierarchies, and that in Linux they are separated by `\`, etc.

{% include alerts/tip.html content="If you are not accustomed to using Linux, this is an excellent chance to learn. It’s free -- just download and run a virtual machine (VM) such as
[VirtualBox](https://www.virtualbox.org), then install a Linux distribution such as [Ubuntu](https://www.ubuntu.com) ([AOSP vets Ubuntu as well](https://source.android.com/source/initializing.html)).
Any recent 64-bit version should work great, but the latest Long Term Support (LTS) version is recommended. There are plenty of instructions on setting up VirtualBox to run Ubuntu, so we'll leave that to you. Though it is worth noting, if you already use either a Linux distro or macOS, you can just proceed." %}

Let's begin!

## Build LineageOS

{% include alerts/note.html content="You only need to do these steps once. If you have already prepared your build environment and downloaded the source code,
skip to [Start the build](#start-the-build)" %}

{% include templates/device_build_host_setup.md %}


### Initialize the LineageOS source repository

The following branches have been tested for building emulator images:

* lineage-16.0
* lineage-17.1
* lineage-18.1

Enter the following to initialize the repository:

{% include alerts/note.html content="Make sure the branch you enter here is the one you wish to build!" %}

```
cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1
```

### Download the source code

To start the download of the source code to your computer, type the following:

```
repo sync
```

The LineageOS manifests include a sensible default configuration for repo, which we strongly suggest you use (i.e. don't add any options to sync).
For reference, our default values are `-j 4` and `-c`. The `-j 4` part implies be four simultaneous threads/connections. If you experience
problems syncing, you can lower this to `-j 3` or `-j 2`. On the other hand, `-c` makes repo to pull in only the current branch instead of all branches that are available on GitHub.

{% include alerts/note.html content="This may take a while, depending on your internet speed. Go and have a beer/coffee/tea/nap in the meantime!" %}

{% include alerts/tip.html content="The `repo sync` command is used to update the latest source code from LineageOS and Google. Remember it, as you may want to
do it every few days to keep your code base fresh and up-to-date. But note, if you make any changes, running `repo sync` may wipe them away!" %}


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

Notably, one can also build Android TV format verions of each arch above, the options for this are as follows:

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
