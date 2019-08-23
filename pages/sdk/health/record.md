---
sidebar: home_sidebar
title: Health Store - Records
folder: sdk
permalink: sdk/api/health/records.html
tags:
 - sdk
 - health-store
---
## Overview

A record is the most generic data structure. Any data inside the store is a record.
Records can be queried by category, uid or category + time frame.
Records have a category uid to be batch-fetched.

## Generic `Record`

The base Record class defines the general behavior of all the record types.

| Field name | Type   | Description                              | Runtime access | Default      |
|------------|--------|------------------------------------------|----------------|--------------|
| `uid`      | long   | Unique identifier (managed internally)   | Read           | -1L          |
| `category` | int    | Category of the record                   | Read           | -1           |
| `time`     | long   | Time of the record was made              | Read, write    | new Date(0L) |
| `end`      | long   | (Optional) Time of when the record ended | Read, write    | new Date(0L) |
| `symbol`   | String | (Optional) Measure unit symbol           | Read           | null         |
{: .table }

### Categories

Categories organize record data under a hierarchy. Categories use a 3-digit UID
system, with the first digit representing the macro level and the second two
representing the sub category.

| Example      | Macro level | Category (data class) |
| 302          | 3           | 02                    |
| Category uid | Mindfulness | SleepRecord           |
{: .table }

#### UID organization

* 000 - 099: [Hearth & Blood](#heart--blood)
* 100 - 199: [Body](#body)
* 200 - 299: [Breathing](#breathing)
* 300 - 399: [Mindfulness](#mindfulness)
* 400 - 499: [Activities](#activities)

## Supported records

The system will provide a number of record types out of the box.

### Heart & blood

| uid | Name                 | Description           | Values                                                                         |
|-----|----------------------|-----------------------|--------------------------------------------------------------------------------|
| 000 | BACRecord            | Blood/Alcohol content | float (%), time                                                                |
| 001 | BloodPressureRecord  | Blood pressure        | integer (systolic) (mmHg), integer (diastolic) (mmHg),  time                   |
| 002 | GlucoseRecord        | Glucose & insulin     | float (mmol/L), boolean (is before meal), float (insulin), float (basal), time |
| 003 | HearthRateRecord     | Heart rate            | integer (BPM), time                                                            |
| 004 | PerfusionIndexRecord | Perfusion index       | float, time                                                                    |
{: .table }

### Body

| uid | Name                         | Description                        | Values                     |
|-----|------------------------------|------------------------------------|----------------------------|
| 100 | AbdominalCircumferenceRecord | Abdominal circumference            | float (cm), time           |
| 101 | BodyMassIndexRecord          | Body mass index (BMI)              | float, time                |
| 102 | BodyTemperatureRecord        | Body temperature                   | float (celsius), time      |
| 103 | LeanBodyMassRecord           | Lean mass                          | float, time                |
| 104 | MenstrualCycleRecord         | Menstrual Cycle flow               | integer (flow level), time |
| 105 | UvIndexRecord                | UV index                           | float, time                |
| 106 | WaterIntakeRecord            | Glass of water intake              | time                       |
| 107 | WeightRecord                 | Weight (can convert to mass in kg) | float (N), time            |
{: .table }

### Breathing

| uid | Name                     | Description                | Values                          |
|-----|--------------------------|----------------------------|---------------------------------|
| 200 | InhalerUsageRecord       | Inhaler use                | string (optional notes), time   |
| 201 | OxygenSaturationRecord   | Oxygen saturation          | float (%), time                 |
| 202 | PeakExpiratoryFlowRecord | Peak expiratory flow (PEF) | float (L/min), time             |
| 203 | RespiratoryRateRecord    | Respiratory rate           | integer (breaths per min), time |
| 204 | VitalCapacityRecord      | Vital capacity             | integer (cm^3), time            |
{: .table }

### Mindfulness

| uid | Name             | Description         | Values                                              |
|-----|------------------|---------------------|-----------------------------------------------------|
| 300 | MeditationRecord | Meditation duration | begin, end                                          |
| 301 | MoodRecord       | Mood Journal        | integer (mood level), string (optional notes), time |
| 302 | SleepRecord      | Sleep duration      | begin, end                                          |
{: .table }

### Activities

| uid | Name          | Description      | Values                                 |
|-----|---------------|------------------|----------------------------------------|
| 400 | CyclingRecord | Cycling distance | float (km), begin, end                 |
| 401 | RunningRecord | Running distance | float (km), begin, end                 |
| 402 | StepsRecord   | Number of steps  | integer (steps), begin, end            |
| 403 | WorkoutRecord | Workout exercise | integer (calories), string, begin, end |
{: .table }

## Reading Records

Reading records requires the `lineageos.permission.READ_HEALTH_STORE`
permission. See [here]({{ "sdk/api/health/health-store.html#Runtime-permissions-1" | relative_url }})
how to obtain it.

**Kotlin**
{% highlight kotlin %}
val healthStore = HealthStore.getInstance(context)
// All the HearthRateRecords
val hearthRateRecords = healthStore.getRecords(HearthRateRecord.CATEGORY)

// This week's SleepRecords
val begin = Date(System.currentTimeMillis() - (1000 * 60 * 60 * 24 * 7))
val end = Date()
val lastWeekSleep = healthStore.getRecordsInTime(SleepRecord.CATEGORY, begin, end)

// A specific record given its uid, may be null
val uid = 1027L
val myRecord: Record? = healthStore.getRecord(uid)
{% endhighlight %}

**Java**
{% highlight java %}
final HealthStore healthStore = HealthStore.getInstance(context);
// All the HearthRateRecords
final List<Record> hearthRateRecords = healthStore.getRecords(HearthRateRecord.CATEGORY);

// This week's SleepRecords
long begin = new Date(System.currentTimeMillis() - (1000 * 60 * 60 * 24 * 7));
long end = new Date();
final List<Record> lastWeekSleep = healthStore.getRecordsInTime(SleepRecord.CATEGORY, begin, end);

// A specific record given its uid, may be null
final long uid = 1027L;
final Record myRecord = healthStore.getRecord(uid)
{% endhighlight %}

## Writing a Record

Writing records requires the `lineageos.permission.WRITE_HEALTH_STORE`
permission. See [here]({{ "sdk/api/health/health-store.html#Runtime-permissions-1" | relative_url }})
how to obtain it.

**Kotlin**
{% highlight kotlin %}
val myRecord = HearthRateRecord(Date(), 61)

val healthStore = HealthStore.getInstance(context)
val success: Boolean = healthStore.writeRecord(myRecord)
{% endhighlight %}

**Java**
{% highlight java %}
final HearthRateRecord myRecord = new HearthRateRecord(new Date(), 61)

final HealthStore healthStore = HealthStore.getInstance(context);
final boolean success = healthStore.writeRecord(myRecord);
{% endhighlight %}

## New record types

Apps developers can't define their own custom category for
security and compatibilty reasons. We encourage instead to submit your
Record type so that it will be added to the official sdk and
everyone will be able to benefit from it.

You can send your new record implementation through our
[gerrit instance]({{ "submitting-patch-howto.html" | relative_url }}).
