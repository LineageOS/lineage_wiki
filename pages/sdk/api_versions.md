---
sidebar: home_sidebar
title: LineageSDK API versions
folder: sdk
permalink: sdk/api-versions.html
tags:
 - sdk
---

## Overview

Different devices may run different versions of LineageOS. Each successive build may add new APIs not available in the previous version.
To indicate which set of APIs are available, each platform version specifies an API level.
For instance, the initial LineageOS 15.1 API level was 8, while after a some releases new APIs were added and so it was bumped to API level 9.

To help decipher which APIs are available to you at any given point (if at all), we’ve created a copy
of the [Build API](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/os/Build.html) from AOSP allowing you to programmatically
compare the devices current API version to see if specific features are available or not.

For example, to utilize the Styles functionality on a device, a simple call to retrieve the SDK
constant and comparing it against the Ilama API level allows you to see if your application is running
on a LineageOS device that can support the new SDK feature:

### Checking the LineageSDK version using the Build API

**Kotlin**
{% highlight kotlin %}
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

Likewise, this API also allows you to see if you're running on a LineageOS device at all by seeing if [`SDK_INT`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/os/Build.LINEAGE_VERSION.html#SDK_INT) returns a value greater than 0.

### Checking the LineageSDK version without the Build API

Some times you may want to check the LineageSDK version to toggle a feature that does not require you to
include the sdk library itself (such as [tuning the app style basing on the system style]({{ "sdk/api/styles.html#match-the-global-style-1" | relative_url }})).
In this case adding the sdk library itself would add (almost) zero benefits at the cost of increasing the app size.
You can check the LineageSDK version using the `getprop` binary, by executing it in a [`Process`](https://docs.oracle.com/javase/8/docs/api/java/lang/Process.html).
Here you can find a simple method you can copy-paste right into your app to check the LineageSDK version of the device your app is being run on.

**Kotlin**
{% highlight kotlin %}
// Returns 0 if no LineageSDK version is found
fun getLineageSDKVersion() = try {
    val process = Runtime.getRuntime().exec("getprop ro.lineage.build.version.plat.sdk")
    val reader = BufferedReader(InputStreamReader(process.inputStream))
    val output = StringBuilder()
    var line = reader.readLine()
    while (line != null) {
        output.append(line)
        line = reader.readLine()
    }

    val result = output.toString()
    if (result.isEmpty()) 0 else result.toInt()
} catch (e: IOException) {
    0.also { e.printStackTrace() }
} catch (ignored: NumberFormatException) {
    // This is not what we're looking for, fallback to default
    0
}
{% endhighlight %}

**Java**
{% highlight java %}
// Returns "" if no LineageSDK version is found
int getLineageSDKVersion() {
    try {
        Process process = Runtime.getRuntime().exec("getprop ro.lineage.build.version.plat.sdk");
        BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));
        StringBuilder output = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            output.append(line);
        }

        String result = output.toString();
        return TextUtils.isEmpty(result) ? 0 : Integer.parseInt(result);
    } catch (IOException e) {
        e.printStackTrace();
    } catch (NumberFormatException ignored) {
        // This is not what we're looking for, fallback to default
    }

    return 0;
}
{% endhighlight %}



## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).

You can also find more information in the [LineageSDK javadoc](https://lineageos.github.io/android_lineage-sdk).
