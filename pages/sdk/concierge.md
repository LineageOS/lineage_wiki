---
sidebar: home_sidebar
title: Concierge
folder: sdk
permalink: sdk/concierge.html
tags:
 - sdk
---

## Concept

The LineageSDK consumer library is built as a static jar, so any consumer of
it can end up in a scenario where their client (apk) is utilizing a protocol
that is either newer or older than what is supported by the framework in
LineageOS on whatever device they're running on.

This variance can happen after any release, our clients may end up sending us
marshalled data that is either longer than expected or shorter than expected
which may cause object corruption when attempting to recreate the custom
parcelable utilizing the common CREATOR pattern in android.

To work around this you need to inject parcel headers as per the example
of [DashClock](https://github.com/romannurik/dashclock/blob/8d9581d410a2f488d30cfb5a5525630e3f54160b/api/src/main/java/com/google/android/apps/dashclock/api/ExtensionData.java#L75) by Roman Nurik.

## Model

To inject the parcel header, Concierge writes a few items in the first few
datapositions of the Parcel, most notably, it writes the
[PARCELABLE_VERSION](https://github.com/LineageOS/android_lineage-sdk/blob/63a590625c6c76f82e5ef43408a52238b2b34e43/sdk/src/java/lineageos/os/Concierge.java#L67):

{% highlight java %}
// Write parcelable version, make sure to define explicit changes
// within {@link #PARCELABLE_VERSION);
mParcel.writeInt(mParcelableVersion);

// Inject a placeholder that will store the parcel size from this point on
// (not including the size itself).
mSizePosition = parcel.dataPosition();
mParcel.writeInt(0);
mStartPosition = parcel.dataPosition();
{% endhighlight %}

To inversely read it, Concierge fetches the parcelable version for you by
reading the injected header and providing you a simple interface to fetch
it through.

{% highlight java %}
mParcel = parcel;
// Read {@link #PARCELABLE_VERSION) from the header
mParcelableVersion = parcel.readInt();
// Get the size
mParcelableSize = parcel.readInt();
// Get the expected start position per parcel nesting
mStartPosition = parcel.dataPosition();
{% endhighlight %}

## Usage

Since Concierge handles your parcels and makes sure they get marshalled and
unmarshalled correctly when cross IPC boundaries even when there is a version
mismatch between the client sdk level and the framework implementation,
there is only the responsibility of decrementing from latest to earliest
release within your parceling.

On incoming parcel (to be unmarshalled):

**kotlin**
{% highlight kotlin %}
val incomingParcelInfo = Concierge.receiveParcel(incomingParcel)
val parcelableVersion = incomingParcelInfo.parcelVersion

// Do unmarshalling steps here iterating over every plausible version
when {
    parcelableVersion >= Build.LINEAGE_VERSION_CODES.JACKFRUIT -> {
        // Read API 10+ data...
    }
    parcelableVersion >= Build.LINEAGE_VERSION_CODES.ILAMA -> {
        // Read API 9+ values...
        // Set default values for API 10+ data...
    }
    // ...
}

// Complete the process
incomingParcelInfo.complete()
{% endhighlight %}

**Java**
{% highlight java %}
ParcelInfo incomingParcelInfo = Concierge.receiveParcel(incomingParcel);
int parcelableVersion = incomingParcelInfo.getParcelVersion();

// Do unmarshalling steps here iterating over every plausible version
if (parcelableVersion >= Build.LINEAGE_VERSION_CODES.JACKFRUIT) {
    // Read API 10+ data...
} else if (parcelableVersion >= Build.LINEAGE_VERSION_CODES.ILAMA) {
    // Read API 9 values...
} // ...

// Complete the process
incomingParcelInfo.complete();
{% endhighlight %}

On outgoing parcel (to be marshalled):

**kotlin**
{% highlight kotlin %}
val outgoingParcelInfo = Concierge.prepareParcel(incomingParcel)

// Do marshalling steps here iterating over every plausible version
when {
    parcelableVersion >= Build.LINEAGE_VERSION_CODES.JACKFRUIT -> {
        // Write API 10+ data...
    }
    parcelableVersion == Build.LINEAGE_VERSION_CODES.ILAMA -> {
        // Write API 9 values...
    }
    // ...
}

// Complete the process
outgoingParcelInfo.complete()

{% endhighlight %}

**Java**
{% highlight java %}
ParcelInfo outgoingParcelInfo = Concierge.prepareParcel(incomingParcel);

// Do marshalling steps here iterating over every plausible version
if (parcelableVersion >= Build.LINEAGE_VERSION_CODES.JACKFRUIT) {
    // Write API 10+ data...
} else if (parcelableVersion >= Build.LINEAGE_VERSION_CODES.ILAMA) {
    // Write API 9 values...
    // Set defaults for API 10+ data...
} // ...

// Complete the process
outgoingParcelInfo.complete();
{% endhighlight %}
