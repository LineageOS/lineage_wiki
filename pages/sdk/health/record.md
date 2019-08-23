---
sidebar: home_sidebar
title: Health Store - Record
folder: sdk
permalink: sdk/api/health/record.html
tags:
 - sdk
 - health-store
---
## Overview

This data object contains “static” information about the user/person.
There can be only one MedicalProfile in a `HealthStore` database.

## Generic `Record`

The base [Record]() class defines the general behavior of all the record types.

| Field name  | Class type | Description                                  | Runtime access | Default |
|-------------|------------|----------------------------------------------|----------------|---------|
| `uid`       | long       | Unique identifier (managed internally)       | Read           | -1L     |
| `category`  | int        | Category of the record                       | Read           | -1      |
| `timestamp` | long       | Timestamp of the record in millisec          | Read, write    | 0L      |
| `duration`  | long       | (Optional) Duration of the record in millsec | Read, write    | 0L      |
| `symbol`    | String     | (Optional) Measure unit symbol               | Read           | null    |
{: .table }

### Categories

Categories organize record data under a hierarchy. Categories use a 3-digit UID
system, with the first digit representing the macro level and the second two
representing the sub category.

| Example      | Macro level | Category (data class) |
| 103          | 1           | 05                    |
| Category uid | Body        | BodyTemperatureRecord |


#### UID organization

* 000 - 099: Hearth & Blood
* 100 - 199: Body
* 200 - 299: Breathing
* 300 - 399: Sleep & Mindfulness

## Supported records

The system will provide a number of record types out of the box.

### Heart & blood

* BACRecord
    * Blood/Alcohol content
    * uid 000
    * float (%)
    * timestamp
* BloodPressureRecord
    * Blood pressure
    * uid 001
    * integer (systolic) (mmHg)
    * integer (diastolic) (mmHg)
    * timestamp
* GlucoseRecord
    * Glucose & insulin
    * uid 002
    * float (value) (mmol/L)
    * before/after meal (boolean)
    * float (insulin)
    * float (bascal)
    * timestamp
* HearthRateRecord
    * Heart rate
    * uid 003
    * integer (BPM)
    * timestamp
* PerfusionIndexRecord
    * Peripheral perfusion index (PI)
    * uid 004
    * float
    * timestamp

### Body

* AbdominalCircumferenceRecord
    * Abdominal circumference
    * uid 100
    * float (cm)
    * timestamp
* BodyMassIndexRecord
    * Body mass index (BMI)
    * uid 101
    * float
    * timestamp
* BodyTemperatureRecord
    * Body temperature
    * uid 102
    * float (celcius)
    * timestamp
* LeanBodyMassRecord
    * Lean mass
    * uid 103
    * float
    * timestamp
* MenstrualCycleRecord
    * Menstrual Cycle
    * uid 104
    * integer (flow level 1-4)
    * timestamp
* UvIndexRecord
    * UV index
    * uid 105
    * float
    * timestamp

### Breathing

* InhalerUsageRecord
    * Inhaler use
    * uid 200
    * string (optional)
    * timestamp
* OxygenSaturationRecord
    * Oxygen saturation
    * uid 201
    * float (%)
    * timestamp
* PeakExpiratoryFlowRecord
    * Peak expiratory flow (PEF)
    * uid 202
    * float (L/min)
    * timestamp
* RespiratoryRateRecord
    * Respiratory rate
    * uid 203
    * integer (breaths per min)
    * timestamp
* VitalCapacityRecord
    * Vital capacity
    * uid 204
    * integer (cm^3)
    * timestamp

### Sleep & Mindfulness

* MeditationRecord
    * Meditation duration
    * uid 300
    * timestamp (begin time)
    * timestamp (end time)
* SleepRecord
    * Sleep duration
    * uid 301
    * timestamp (begin time)
    * timestamp (end time)


## Custom record types

Apps developers may define their own custom category, which will **not** be shown
In the system management app. While it's possible for developers to
use a custom category, we will not safeguard against category uid
conflicts between 3rd party apps. We encourage you to submit your
custom Record implementation to our [gerrit](https://review.lineageos.org)
so that it will be added to the official sdk so that everyone will be able
to use a standard implementation that will never run into uid or implementation
conflicts.


## Implementing a custom record type

When creating a new record type remember overriding the following methods:

Record objects are serialized with android's
[Parcel](https://developer.android.com/reference/android/os/Parcel.html).
To make sure your data is properly stored and retrieved, override
the `writeValueTo(Parcel)` and `readValueFrom(Parcel)` methods

**Kotlin**
{% highlight kotlin %}
override protected fun writeValueTo(dest: Parcel) {
    dest.writeInt(myValue)
    dest.writeString(myOtherValue)
}

override protected fun readValueFrom(parcel: Parcel) {
    myValue = parcel.readInt()
    myOtherValue = parce.readString()
}
{% endhighlight %}

**Java**
{% highlight java %}
@Override
protected void writeValueTo(Parcel dest) {
    dest.writeInt(myValue);
    dest.writeString(myOtherValue);
}

@Override
protected void readValueFrom(Parcel parcel) {
    myValue = parcel.readInt();
    myOtherValue = parce.readString();
}
{% endhighlight %}

You will also want to define a category for your Record type:

**Kotlin**
{% highlight kotlin %}
override fun getCategory() = CATEGORY

companion object {
    @JvmStatic
    const val CATEGORY = 3022
}
{% endhighlight %}

**Java**
{% highlight java %}
public static final int CATEGORY = 3022;

@Override
public int getCategory() {
    return CATEGORY;
}
{% endhighlight %}
