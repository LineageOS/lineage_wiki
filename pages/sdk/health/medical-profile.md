---
sidebar: home_sidebar
title: Health Store: Medical Profile
folder: sdk
permalink: sdk/api/health-store.html
tags:
 - health-store
---

## Overview

This data object contains “static” information about the user/person.
There can be only one MedicalProfile in a `HealthStore` database.

## Fields

All the fields are accessible with the respective getter and setters
in Java and directly in kotlin.

| Field name      | Class type | Description                                           | Runtime access | Default     |
|-----------------|------------|-------------------------------------------------------|----------------|-------------|
| `name`          | String     | Full name of the user                                 | Read, write    | ""          |
| `birthdate`     | long       | Timestamp in millisec of the day of birth of the user | Read, write    | 0L          |
| `biologicalSex` | int        | Biological sex of the user                            | Read, write    | (unset / 0) |
| `weight`        | float      | Weight of the user in Kg                              | Read, write    | 0f          |
| `height`        | float      | Height of the user in cm                              | Read, write    | 0f          |
| `bloodType`     | int        | Blood type of the user                                | Read, write    | (unset / 0) |
| `organDonor`    | int        | Whether the user is an organ donor                    | Read, write    | (unset / 0) |
| `medications`   | String     | Medications of the user                               | Read, write    | ""          |
| `allergies`     | String     | Allergies of the user                                 | Read, write    | ""          |
| `conditions`    | String     | Medical conditions of the user                        | Read, write    | ""          |
| `notes`         | String     | Optional notes                                        | Read, write    | ""          |
{: .table }

## Reading MedicalProfile

Reading the medical profile requires the `lineageos.permission.READ_HEALTH_STORE`
permission. See [here]({{ "sdk/api/health/health-store.html#Runtime-permissions-1" | relative_url }})
how to obtain it.

**Kotlin**
{% highlight kotlin %}
val healthStore = HealthStore.getInstance(context)
val medicalProfile = healthStore.medicalProfile

// Greet the user with a toast
val message = "Hello ${medicalProfile.name}!"
Toast.makeText(context, message, Toast.LENGHT_LONG).show()
{% endhighlight %}

**Java**
{% highlight java %}
final HealthStore healthStore = HealthStore.getInstance(context);
final MedicalProfile medicalProfile = healthStore.getMedicalProfile();

// Greet the user with a toast
final String message = String.format("Hello %1$s!", medicalProfile.getName());
Toast.makeText(context, message, Toast.LENGHT_LONG).show();
{% endhighlight %}

## Writing MedicalProfile

Writing the medical profile requires the `lineageos.permission.WRITE_HEALTH_STORE`
permission. See [here]({{ "sdk/api/health/health-store.html#Runtime-permissions-1" | relative_url }})
how to obtain it.

**Kotlin**
{% highlight kotlin %}
// Decrease weight by 0.2Kg
myMedicalProfile.weight -= 0.2f

// save
val healthStore = HealthStore.getInstance(context)
healthStore.medicalProfile = myMedicalProfile
{% endhighlight %}

**Java**
{% highlight java %}
// Decrease weight by 0.2Kg
myMedicalProfile.setWeight(
    myMedicalProfile.getWeight() - 0.2f
);

// save
final HealthStore healthStore = HealthStore.getInstance(context);
healthStore.setMedicalProfile(myMedicalProfile);
{% endhighlight %}
