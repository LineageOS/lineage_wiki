---
sidebar: home_sidebar
title: Styles API
folder: sdk
permalink: styles-api.html
tags:
 - sdk
---

## Overview

The styles API allows applications to both change and get changed colors. This has been introduced in LineageSDK API 9 (March 2018).

## Tune the app style basing on system

Changing the app style basing on the system configuration only requires the [appcompat-v7 library](https://developer.android.com/topic/libraries/support-library/packages.html#v7-appcompat).

### Match the global style

In order for your app to match the global style, you need to make your application theme a child of `Theme.AppCompat.DayNight`.
This theme allows to create a dark mode using the `-night` resources modifier. In day/light mode it inherits from the `Theme.AppCompat.Light` theme,
in night/dark mode it inherits from the `Theme.AppCompat` theme.

Here's an example of how to make your app follow the LineageOS global style:

**res/values/styles.xml**
{% highlight xml %}
<style name="AppTheme" parent="Theme.AppCompat.DayNight">
    <!-- Use the light statusbar only when in day/light mode -->
    <item name="android:windowLightStatusBar">@bool/is_theme_light</item>
</style>
{% endhighlight %}

**res/values/bools.xml**
{% highlight xml %}
<bool name="is_theme_light">true</bool>
{% endhighlight %}

**res/values-night/bools.xml**
{% highlight xml %}
<bool name="is_theme_light">false</bool>
{% endhighlight %}

### Get the current system default accent color

There's no way to reference this value in a xml resource, but it's possible to get the system's
accent color using this method:

**Kotlin**
{% highlight kotlin %}
@ColorInt
private fun getAccentColor(): Int {
    val attr = intArrayOf(android.R.attr.colorAccent)
    val typedArray = obtainStyledAttributes(android.R.style.Theme_DeviceDefault, attr)
    return typedArray.getColor(0, Color.BLACK)
            .also { typedArray.recycle() }
}
{% endhighlight %}

**Java**
{% highlight java %}
@ColorInt
private int getAccentColor() {
    int[] attr = { android.R.attr.colorAccent };
    TypedArray typedArray = obtainStyledAttributes(android.R.style.Theme_DeviceDefault, attr);
    int color = typedArray.getColor(0, Color.BLACK);
    typedArray.recycle();
    return color;
}
{% endhighlight %}

### Handling non-LineageOS devices cases

When your app is running on non-LineageOS devices it will use the light style unless you
change it using the `AppCompatDelegate`'s `setDefaultNightMode(Int)` method at runtime passing
one of those as argument:
  - `AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM`: Follow system style (works only on LineageOS devices, on others it fallbacks to light)
  - `AppCompatDelegate.MODE_NIGHT_NO`: Light mode is enforced (only for the app)
  - `AppCompatDelegate.MODE_NIGHT_YES`: Dark mode is enforced (only for the app)


## Tune the system style from an app

By importing the [LineageSDK library]({{ ".add-to-your-app.html" | relative_url }}) you can access
the `StyleInterface` API that will allow you to set the system global style and accent.


### Requesting the permission

In order to be able to use this API you need to get your app granted the `lineageos.permission.CHANGE_STYLE` permission.
This is marked as a [_dangerous_ permission](https://developer.android.com/guide/topics/permissions/overview.html#dangerous_permissions)
so you'll have to both declare it in the manifest and [request it at runtime](https://developer.android.com/training/permissions/requesting.html#make-the-request).

### Changing the global style

In order to change the global style you need to get the [StyleInterface](TODO: add link to javadoc) instance by using `StyleInterface.getInstance(Context)`.
Once you've got an instance and you made sure the app has been granted the permission to change styles,
you can set the global style choosing one of the 4 possible configurations using the `setGlobalStyle(Int, String)`
method passing one of those as the first argument (the second one is your app's packageName):

  - `StyleInterface.STYLE_GLOBAL_AUTO_WALLPAPER`: Style is based on the user wallpaper
  - `StyleInterface.STYLE_GLOBAL_AUTO_DAYTIME`: Style is based on the day time
  - `StyleInterface.STYLE_GLOBAL_LIGHT`: Light style is enforced
  - `StyleInterface.STYLE_GLOBAL_DARK`: Dark is enforced

**Kotlin**
{% highlight kotlin %}
private fun setGlobalStyle(context: Context, turnDark: Boolean) {
    val styleInterface = StyleInterface.getInstance(context)
    // [...] check for permission
    styleInterface.setGlobalStyle(
            if (turnDark) StyleInterface.STYLE_GLOBAL_DARK
            else StyleInterface.STYLE_GLOBAL_LIGHT,
            context.getPackageName())
}
{% endhighlight %}

**Java**
{% highlight java %}
private void setGlobalStyle(Context context, boolean turnDark) {
    StyleInterface styleInterface = StyleInterface.getInstance(context);
    // [...] check for permission
    styleInterface.setGlobalStyle(turnDark ?
            StyleInterface.STYLE_GLOBAL_DARK : StyleInterface.STYLE_GLOBAL_LIGHT,
            context.getPackageName());
}
{% endhighlight %}


### Changing the accent style

In order to change the global style you need to get the [StyleInterface](TODO: add link to javadoc) instance by using `StyleInterface.getInstance(Context)`.
Once you've got an instance and you made sure the app has been granted the permission to change styles,
you can set the global accent choosing one of the 4 possible configurations using the `setAccent(String)`
method passing the accent overlay package name as argument.

You can get a list of trusted accent packages names with the `StyleInterface`'s `getTrustedAccents()` method.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).

You can also find more information in the [LineageSDK javadoc](TODO: add link to javadoc).
