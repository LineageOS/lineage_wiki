---
sidebar: home_sidebar
title: How to import the sources to Android Studio
folder: how-tos
redirect_from: import-android-studio-howto.html
permalink: /how-to/import-to-android-studio
tags:
 - how-to
---

## Install Android Studio for Platform

{% include alerts/warning.html content="You must be using a Linux distribution to install this. All other operating systems are not supported." %}
<!-- Remove the following warning after Google makes this a stable build. -->
{% include alerts/warning.html content="Android Studio for Platform is using a beta version of Android Studio. **Proceed at your own risk!**" %}
Go to the [Download page](https://developer.android.com/studio/platform) and download the package. Follow the instructions under "Get started with ASfP" if you are using a Debian-based Linux distribution (such as Ubuntu).

For all other Linux distributions, unpack `data.tar.xz` from the downloaded file, then unpack `data.tar.xz` to a destination of your choice. Follow the instructions described in `Install-Linux-tar.txt` file which is in the extracted folder.

## Start working with Android Studio

Open Android Studio and click on **Import Asfp Project**.

Then set the Repo checkout to your Android source directory.

Set your lunch target to the device you want to build (e.g. `lineage_arm64-userdebug`). Everything before and after `arm64` is required. Check our [list of devices]({{ "/devices" | relative_url }}) to get started.

If there are any modules you want to work on, you must specify them as module paths. By default, Android Studio will not open any paths.

{% include alerts/tip.html content="If you wish to add more module paths in the future, you can do so by modifying the `asfp-config.json` file in your project." %}

{% include alerts/note.html content="Opening the project the first time or after a fresh sync can take a while. You should wait until any indexing of files is done to be sure that every IDE feature is ready to use." %}

### Start developing

Now, after all the previous steps are done, you can actually start developing and exploring the sources. The `Find in path` function (**Edit -> Find -> Find in path**) can be a good start to find a file you want to modify. Just search for a known string among all source files and then dive in deeper until you actually found the function you want to modify.

### Contribute!

After you have modified the sources and tested your change, you can contribute to LineageOS by [submitting your work]({{ "/how-to/submitting-patches" | relative_url }}).

