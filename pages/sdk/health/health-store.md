---
sidebar: home_sidebar
title: Health Store
folder: sdk
permalink: sdk/api/health/health-store.html
tags:
 - sdk
 - health-store
---

## Overview

The HealthStore allows applications to store and access health and clinical
data in a secure on-device repository.
This has been introduced in LineageSDK API 10 (September 2019).

HealthStore aims at being a solid option for tracking and safeguarding
medical information by offering a wide view of stored data while keeping it
protected under a strong system-level API that gives users ultimate power
over its access.

## Data objects

The API makes use of two data objects:

* [Medical profile]({{ "sdk/api/health/medical-profile.html" | relative_url }})
* [Records & categories]({{ "sdk/api/health/records.html" | relative_url }})

## Privacy & permissions

Read and write access have their own separate Android runtime permissions.
Even if an app is granted access through standard permissions, apps can be
blacklisted from selected categories by users.

If an app tries to read data from a category it has been blacklisted from,
an empty data set will be returned.
Likewise, if an app tries to write to a blacklisted category, the operation
will fail.

A special permission, granted only to privileged / sys-signature apps,
guards access to modifying the blacklist.

### Runtime permissions

Read and write operations require the respective Android
[runtime permissions](https://developer.android.com/guide/topics/permissions/overview.html#dangerous_permissions)
to be allowed in order to be executed, otherwise a `SecurityException` is thrown.

The read permission is `lineageos.permission.READ_HEALTH_STORE`.
The write permission is `lineageos.permission.WRITE_HEALTH_STORE`.

Define the one you want to use (or both) in your `AndroidManifest.xml`

**AndroidManifest.xml**
{% highlight xml %}
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    ...>

    <!-- Read permission -->
    <uses-permission android:name="lineageos.permission.READ_HEALTH_STORE" />
    <!-- Write permission -->
    <uses-permission android:name="lineageos.permission.WRITE_HEALTH_STORE" />
{% endhighlight %}

#### Check whether the permission has been granted

This example makes use of [ContextCompat](https://developer.android.com/reference/androidx/core/content/ContextCompat.html),
but there are [other ways](https://developer.android.com/training/permissions/requesting) for requesting a runtime permission.

**Kotlin**
{% highlight kotlin %}
val canRead = ContextCompat.checkSelfPermission(
    context,
    HealthStore.HEALTH_STORE_READ_PERMISSION
) == PackageManager.PERMISSION_GRANTED
val canWrite = ContextCompat.checkSelfPermission(
    context,
    HealthStore.HEALTH_STORE_WRITE_PERMISSION
) == PackageManager.PERMISSION_GRANTED
{% endhighlight %}

**Java**
{% highlight java %}
boolean canRead = ContextCompat.checkSelfPermission(
    context,
    HealthStore.HEALTH_STORE_READ_PERMISSION) == PackageManager.PERMISSION_GRANTED;
boolean canWrite = ContextCompat.checkSelfPermission(
    context,
    HealthStore.HEALTH_STORE_WRITE_PERMISSION) == PackageManager.PERMISSION_GRANTED;
{% endhighlight %}

#### Request

This example makes use of [ActivityCompat](https://developer.android.com/reference/androidx/core/app/ActivityCompat.html),
but there are [other ways](https://developer.android.com/training/permissions/requesting) for requesting a runtime permission.

**Kotlin**
{% highlight kotlin %}
// Insert only the required permission(s) in this array
val permissionsToRequest = arrayOf(
    HealthStore.HEALTH_STORE_READ_PERMISSION,
    HealthStore.HEALTH_STORE_WRITE_PERMISSION
)
val reqCode = 123 // This is your own request code
ActivityCompat.requestPermissions(
    activity,
    permissionsToRequest,
    reqCode
)
val canRead = context.checkSelfPermission() == PackageManager.PERMISSION_GRANTED
val canWrite = context.checkSelfPermission() == PackageManager.PERMISSION_GRANTED
{% endhighlight %}

**Java**
{% highlight java %}
String[] permissionsToRequest = new String[] {
    HealthStore.HEALTH_STORE_READ_PERMISSION,
    HealthStore.HEALTH_STORE_WRITE_PERMISSION
};
int reqCode = 123; // This is your own request code
ActivityCompat.requestPermissions(activity, permissionsToRequest, reqCode);

boolean canRead = context.checkSelfPermission() == PackageManager.PERMISSION_GRANTED;
boolean canWrite = context.checkSelfPermission() == PackageManager.PERMISSION_GRANTED;
{% endhighlight %}

## Access the HealthStore

**Kotlin**
{% highlight kotlin %}
val healthStore = HealthStore.getInstance(context)
{% endhighlight %}

**Java**
{% highlight java %}
final HealthStore healthStore = HealthStore.getInstance(context);
{% endhighlight %}

#### Checking if `HealthStore` is supported

You can find out whether the HealthStore is available by checking the whether
the installed LineageSDK version (if any) is at least
[`10`](https://lineageos.github.io/android_lineage-sdk/reference/lineageos/os/Build.LINEAGE_VERSION_CODES.html#JACKFRUIT).
On the [LineageSDK API versions]({{ "sdk/api-versions.html" | relative_url }}) page you can find out how to get the current SDK API level.

## Kotlin support

The HealthStore API is designed to support both Kotlin and Java.
Methods and fields are annotated with `com.android.annotation.Nullable` and
`com.android.annotation.NotNull` to indicate their nullability.

### Using HealthStore with coroutines

While we don't provide native coroutines support, we encourage those of you
who are already using coroutines in their projects to wrap healthStore calls
in `suspend` functions and use `withContext(IO) { /* ... */ }` in them to
run the database operations outside the main thread.

Here's an example of a `HealthStoreRepository` that wraps the
"native" `HealthStore` calls into coroutines.

**Kotlin**
{% highlight kotlin %}
// ...
class HealthStoreRepository private constructor(
    context: Context
) {
    val healthStore = HealthStore.getInstance(context)

    suspend fun getAllRecords() = withContext(IO) {
        healthStore.getRecords(category)
    }

    suspend fun getAllRecords(timeFrame: LongRange) = withContext(IO) {
        healthStore.getRecordsInTimeFrame(category, timeFrame.first, timeFrame.last)
    }

    suspend fun getById(uid: Long): Record? = withContext(IO) {
        healthStore.getRecord(uid)
    }

    suspend fun writeRecord(record: Record) = withContext(IO) {
        healthStore.writeRecord(record)
    }

    suspend fun deleteRecord(record: Record) = withContext(IO) {
        healthStore.deleteRecord(record)
    }

    suspend fun get(): MedicalProfile = withContext(IO) {
        healthStore.medicalProfile
    }

    suspend fun set(medicalProfile: MedicalProfile) = withContext(IO) {
        healthStore.medicalProfile = medicalProfile
    }

    companion object {
        private val instance: HealthStoreRepository? = null

        fun getInstance(context: Context) =
            instance ?: syncronized(this) {
                instance = HeanthStoreRepository(context)
                instance
            }
    }
}
{% endhighlight %}

## Get assistance

If you have any questions or get stuck on any of the steps, feel free to ask on [our subreddit](https://reddit.com/r/LineageOS) or in
[#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).

You can also find more information in the [LineageSDK javadoc](https://lineageos.github.io/android_lineage-sdk).
