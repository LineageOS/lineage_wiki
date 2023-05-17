---
sidebar: home_sidebar
title: Add the LineageSDK to your app
folder: sdk
permalink: sdk/add-to-your-app.html
tags:
 - sdk
---

## Overview

The LineageOS platform SDK is a powerful resource that allows app developers to do more with LineageOS devices.

It is available on all the devices running LineageOS 15.1 (or later). It's also
possible to use the SDK with devices running an unofficial LineageOS build, but we can't assure
the same quality level of an official build.

### Adding to your Android Studio project

You can download the LineageSDK jar library from our [prebuilts repo](https://github.com/LineageOS/android_prebuilts_lineage-sdk).
Once you have downloaded the jar file, insert in the module-level `build.gradle` of your app this dependency:

{% highlight gradle %}
dependencies {
    implementation fileTree(dir: 'libs', include: ['lineage-sdk.jar'])
}
{% endhighlight %}

And put the `lineage-sdk.jar` file in your app's module `libs` folder (usually `app/libs`) and refresh the gradle dependencies.

### Compiling the library from source

In order to compile this library from source, you need to [set up a LineageOS build environment]({{ "devices/angler/build" | relative_url }}).

Once your build environment is ready, run the following commands to generate the .jar  library:

{% highlight bash %}
source build/envsetup.sh
breakfast yourDevice    # Replace yourDevice with your device's codename
croot
make org.lineageos.platform.sdk
{% endhighlight %}

The jar library will be available at the following path:

`out/target/common/obj/JAVA_LIBRARIES/org.lineageos.platform.sdk_intermediates/javalib.jar`

### Compatibility

The library has been tested on both java and kotlin projects.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).

You can also find more information in the [LineageSDK javadoc](https://lineageos.github.io/android_lineage-sdk).
