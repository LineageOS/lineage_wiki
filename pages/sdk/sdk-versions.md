---
sidebar: home_sidebar
title: LineageSDK API versions
folder: sdk
permalink: sdk/api-versions.html
tags:
 - sdk
---

## Overview

Different devices may run different versions of LineageOS. Each succesive build may add new APIs not available in the previous version.
To indicate which set of APIs are available, each platform version specifies an API level.
For instance, the initial LineageOS 15.1 API level was 8, while after a some releases new APIs were added and so it was bumped to API level 9.

To help decipher which APIs are available to you at any given point (if at all), we’ve created a copy
of the [Build API](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/os/Build.html) from AOSP allowing you to programmatically
compare the devices current API version to see if specific features are available or not.

For example, to utilize the Styles functionality on a device, a simple call to retrieve the SDK
constant and comparing it against the Ilama API level allows you to see if your application is running
on a LineageOS device that can support the new SDK feature:

**Kotlin**
{% highlight java %}
fun setGlobalDarkMode(context: Context): Boolean {
    if (Build.LINEAGE_VERSION.SDK_INT < Build.LINEAGE_VERSION_CODES.ILAMA) {
        Log.w(TAG, "This feature requires the LineageSDK API 9 level")
        return false
    }
    val styleInterface = StyleInterface.getInstance(context)
    return styleInterface.setGlobalStyle(StyleInterface.STYLE_GLOBAL_DARK)
}
{% endhighlight %}

**Java**
{% highlight java %}
boolean setGlobalDarkMode(Context context) {
    if (Build.LINEAGE_VERSION.SDK_INT < Build.LINEAGE_VERSION_CODES.ILAMA) {
        Log.w(TAG, "This feature requires the LineageSDK API 9 level");
        return false;
    }
    StyleInterface styleInterface = StyleInterface.getInstance(context);
    return styleInterface.setGlobalStyle(StyleInterface.STYLE_GLOBAL_DARK);
}
{% endhighlight %}

Likewise, this API also allows you to see if you're running on a LineageOS device at all by seeing if [`SDK_INT`](https://jrizzoli.github.io/didactic-pancake/reference/lineageos/os/Build.LINEAGE_VERSION.html#SDK_INT) returns a value greater than 0.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).

You can also find more information in the [LineageSDK javadoc](https://lineageos.github.io/android_lineage-sdk).
