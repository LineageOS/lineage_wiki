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

## Customize the app from the system

Changing the app style basing on the system configuration is easy and only requires the [appcompat-v7 library](https://developer.android.com/topic/libraries/support-library/packages.html#v7-appcompat).
In order for your app to match the global system color, you need to make your application theme a child of `Theme.AppCompat.DayNight`. This theme is capable of reading resources from the `-night` resources modifier, allowing you to create your own dark mode. 

Here's an example of how to make your app follow the LineageOS global style:

**res/values/styles.xml**
```
<style name="AppTheme" parent="Theme.AppCompat.DayNight">
    <!-- Use the light statusbar only when in day/light mode -->
    <item name="android:windowLightStatusBar">@bool/is_theme_light</item>
</style>
```
**res/values/bools.xml**
```
<bool name="is_theme_light">true</bool>
```
**res/values-night/bools.xml**
```
<bool name="is_theme_light">false</bool>
```

To get the current system default accent color you can use this method:

**Kotlin**
```
@ColorInt
private fun getAccentColor(): Int {
    val attr = intArrayOf(android.R.attr.colorAccent)
    val typedArray = obtainStyledAttributes(android.R.style.Theme_DeviceDefault, attr)
    return typedArray.getColor(0, Color.BLACK)
            .also { typedArray.recycle() }
}
```

**Java**
```
@ColorInt
private int getAccentColor() {
    int[] attr = { android.R.attr.colorAccent };
    TypedArray typedArray = obtainStyledAttributes(android.R.style.Theme_DeviceDefault, attr);
    int color = typedArray.getColor(0, Color.BLACK);
    typedArray.recycle();
    return color;
}
```

When your app is running on non-LineageOS devices it will use the light style unless you change it using the `AppCompatDelegate`'s `setDefaultNightMode(Int)` method at runtime passing one of those as argument:
  - AppCompatDelegate.MODE_NIGHT_FOLLOW_SYSTEM - Follow system style (only on LineageOS devices, fallbacks to light)
  - AppCompatDelegate.MODE_NIGHT_NO - Light mode is enforced (only for the app)
  - AppCompatDelegate.MODE_NIGHT_YES - Dark mode is enforced (only for the app)


## Customize the system from the app

By importing the [LineageSDK library]({{ "../lineage_sdk.html" | relative_url }}) you can access the `StyleInterface` API that will allow you to set the system global style and accent.


### Requesting the permission

In order to be able to set the style you need to get your app granted the `lineageos.permission.CHANGE_STYLE` permission. This is marked as a _dangerous_ permission so you'll have to both declare it in the manifest and request it at runtime. Here's how you can request it:

**AndroidManifest.xml**
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="org.lineageos.test">

    <uses-permission android:name="lineageos.permission.CHANGE_STYLE" />
```

**Kotlin**
```
class MainActivityKt : AppCompatActivity() {
    companion object {
        private const val CHANGE_STYLE_PERMISSION = lineageos.platform.Manifest.permission.CHANGE_STYLE
        private const val REQUEST_CHANGE_STYLE = 68
    }

    private fun hasChangeStylePermission() =
            checkSelfPermission(CHANGE_STYLE_PERMISSION) == PackageManager.PERMISSION_GRANTED

    private fun requestChangeStylePermission() =
            requestPermissions(arrayOf(CHANGE_STYLE_PERMISSION), REQUEST_CHANGE_STYLE)
```

**Java**
```
public class MainActivityJava extends AppCompatActivity {
    private static final String CHANGE_STYLE_PERMISSION = lineageos.platform.Manifest.permission.CHANGE_STYLE;
    private static final int REQUEST_CHANGE_STYLE = 68;

    private boolean hasChangeStylePermission() {
        return checkSelfPermission(CHANGE_STYLE_PERMISSION) == PackageManager.PERMISSION_GRANTED;
    }

    private void requestChangeStylePermission() {
        requestPermissions(new String[] { CHANGE_STYLE_PERMISSION }, REQUEST_CHANGE_STYLE);
    }
```


### Changing the global style

In order to change the global style you need to get the [StyleInterface](TODO: add link to javadoc) instance by using `StyleInterface.getInstance(Context)`.
Once you've got an instance and you made sure the app has been granted the permission to change styles, you can set the global style choosing one of the 4 possible configurations using the `setGlobalStyle(Int, String)` method passing one of those as the first argument (the second one is your app's packageName (`Context.getPackageName()`)):

  - StyleInterface.STYLE_GLOBAL_AUTO_WALLPAPER - Style is based on the user wallpaper
  - StyleInterface.STYLE_GLOBAL_AUTO_DAYTIME - Style is based on the day time
  - StyleInterface.STYLE_GLOBAL_LIGHT - Light style is enforced
  - StyleInterface.STYLE_GLOBAL_DARK - Dark is enforced


### Changing the accent style

In order to change the global style you need to get the [StyleInterface](TODO: add link to javadoc) instance by using `StyleInterface.getInstance(Context)`.
Once you've got an instance and you made sure the app has been granted the permission to change styles, you can set the global accent choosing one of the 4 possible configurations using the `setAccent(String)` method passing the accent overlay package name as argument. A list of the default LineageOS accents can be found [here](https://github.com/LineageOS/android_packages_apps_LineageParts/blob/90af02f6ec59cc38507c9faa7e2cf2fbb4df718d/res/values/arrays.xml#L384)


## More information

You can find more information in the [LineageSDK javadoc](TODO: add link to javadoc)
