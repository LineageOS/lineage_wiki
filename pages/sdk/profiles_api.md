---
sidebar: home_sidebar
title: Profiles API
folder: sdk
permalink: sdk/api/profiles.html
tags:
 - sdk
---

## Overview

A Profile is a device state which can be created, modified, or activated for a user based off of an environmental trigger.
When you tell the system to create a profile, it will be populated within the system settings application's Profile viewer.
This hub can both be controlled by the Settings application and by a 3rd party application.

### Creating a Profile

You must specify the UI information, actions, and optional environmental triggers for a Profile utilizing the methods available within the [`Profile`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.html) object.
To add your created Profile to the system, invoke a call to [`ProfileManager.addProfile(Profile)`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/ProfileManager.html)

### Required Profile contents

A Profile object must contain the following:
* An identifying name, set by [`setName(String)`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.html#setName(java.lang.String))
* A [`Profile.Type`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.Type.html), set by [`setProfileType(Int)`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.html#setProfileType(int))

To use these Profiles API, your application must first declare the [write settings permission](http://developer.android.com/reference/android/Manifest.permission.html#WRITE_SETTINGS) in AndroidManifest.xml.

{% highlight xml %}
<uses-permission android:name="android.permission.WRITE_SETTINGS" />
{% endhighlight %}

### Creating and adding a simple Profile

The snippet below details how to create a [`Profile`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.html) object that overrides the devices ring mode settings to be muted.

**Kotlin**
{% highlight kotlin %}
fun createProfile(context: Context) {
    // Create a new Profile object with a label
    val profile = Profile("My New Profile!")

    // We're a toggle!
    profile.profileType = Type.TOGGLE

    // Now create a RingModeSettings object and make set the mode to MUTE with an override of TRUE
    val ringSettings = RingModeSettings(RingModeSettings.RING_MODE_MUTE, true)
    profile.ringMode = ringSettings

    // Add the Profile to the internal service
    ProfileManager.getInstance(context).addProfile(profile)
}
{% endhighlight %}

**Java**
{% highlight java %}
void createProfile(Context context) {
    // Create a new Profile object with a label
    Profile profile = new Profile("My New Profile!");

    // We're a toggle!
    profile.setProfileType(Type.TOGGLE);

    // Now create a RingModeSettings object and make set the mode to MUTE with an override of TRUE
    RingModeSettings ringSettings = new RingModeSettings(RingModeSettings.RING_MODE_MUTE, true);
    profile.setRingMode(ringSettings);

    // Add the Profile to the internal service
    ProfileManager.getInstance(context).addProfile(profile);
}
{% endhighlight %}

To set the profile to be the primary active profile, you can trigger this by calling [`setActiveProfile(UUID)`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/ProfileManager.html#setActiveProfile(java.util.UUID))
by passing the UUID of the created Profile object.

**Kotlin**
{% highlight kotlin %}
fun enableProfile(profile: Profile, context: Context) {
    val profileUuid = profile.uuid
    ProfileManager.getInstance(context).setActiveProfile(profileUuid)
}
{% endhighlight %}

**Java**
{% highlight java %}
void enableProfile(Profile profile, Context context) {
    UUID profileUuid = profile.getUuid();
    ProfileManager.getInstance(context).setActiveProfile(profileUuid);
}
{% endhighlight %}

## Leveraging a ProfileTrigger

For the instances where you want to trigger a Profile based off of an environment change as defined by [`Profile.TriggerType`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.TriggerType.html)
you can set a specific [`Profile.ProfileTrigger`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/app/Profile.ProfileTrigger.html) on your Profile.

To create a ProfileTrigger you'll need to populate 4 parameters, for something like a trigger based off of a WiFi access point, you can follow the model below:

**Kotlin**
{% highlight kotlin %}
fun getTrigger(triggerName: String): Profile.ProfileTrigger {
    val triggerType = Profile.TriggerType.WIFI          // This is a wifi trigger
    val triggerId = trigger.getSSID()                   // Use the AP's SSID as identifier
    val triggerState = Profile.TriggerState.ON_CONNECT  // On Connect of this, trigger

    return Profile.ProfileTrigger(triggerType, triggerId, triggerState, triggerName)
}
{% endhighlight %}

**Java**
{% highlight java %}
Profile.ProfileTrigger getTrigger(String triggerName) {
    int triggerType = Profile.TriggerType.WIFI;         // This is a wifi trigger
    int triggerId = trigger.getSSID();                  // Use the AP's SSID as identifier
    int triggerState = Profile.TriggerState.ON_CONNECT; // On Connect of this, trigger

    return new Profile.ProfileTrigger(triggerType, triggerId, triggerState, triggerName);
}
{% endhighlight %}

As you can see we set the TriggerType as WiFI, set the SSID as the triggerId (for tracking), set the title of the access point as the triggerName,
and then finally declare that we want to be "triggered" when an ON_CONNECT is given for the access point.

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on Libera.Chat](https://kiwiirc.com/nextclient/irc.libera.chat#lineageos).

You can also find more information in the [LineageSDK javadoc](https://lineageos.github.io/android_lineage-sdk).
