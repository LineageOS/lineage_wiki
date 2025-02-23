---
title: Port LineageOS to a new device
permalink: porting_device.html
---

{% include alerts/warning.html content="This guide requires an advanced level of technical knowledge and skill to be completed successfully." %}
So you obtained a new Android device, but LineageOS is not available for it. If you are interested in porting LineageOS to your device, you have come to the right place! This guide will help you get started on your journey and finish with a booting device!

## Prerequisites

* The bootloader on your device **MUST** be unlockable! Otherwise, you will not be able to run LineageOS on your device!
* You must have access to a Linux machine that meets [AOSP requirements](https://source.android.com/docs/setup/start/requirements). You can also setup a virtual machine instead.
* You must have the LineageOS source code downloaded already. If you don't, [follow our instructions on how to download it.](https://github.com/LineageOS/android), and then take the time to familiarize yourself with the source code structure.
* If you have never built LineageOS before, [pick a supported device]({{ "devices" | relative_url }}) and follow its build instructions. It will make building an unsupported device easier, and you may even have a starting point for your work.
* You are expected to read the [AOSP documentation](https://source.android.com/docs). We will link to certain pages of it throughout the guide, but do not assume those will be the only pages you have to read.

If you have fulfilled the prerequisites, then let's begin!

## Collecting information

Before starting your port, you must collect as much information about your device as possible. This information can be found online and on the device itself. The information you must collect includes, but is not limited to:
* The hardware specs (screen resolution, camera, battery, chipset, etc.)
* Features included with the device (dual rear cameras, sensors, FM radio, etc.)
* Codenames (model code, product name, etc.)
* The partition scheme (explained in this guide)

Make sure you have this information stored somewhere that you can refer back to easily. As you work on your port, you will likely collect more information that you will need later on.

### Obtaining the kernel source code

{% include alerts/warning.html content="If you are unable to locate the kernel source code for your device, you may use the prebuilt kernel in the `boot.img` file. However, if you intend on submitting your port to us, prebuilt kernels will not be accepted." %}
Android OEMs must publish this code, as dictated by the [GNU Public License](https://en.wikipedia.org/wiki/GNU_General_Public_License). Some OEMs publish this online, either on their own website or somewhere else, but some may require you to request a copy of that code. You must obtain a copy of this code, since you will need it later.

You must ensure this code is for your device. Some manufacturers will use the same code for multiple devices, which is acceptable to use. Do not use kernel code that is not meant for your device.

### Obtaining build properties

These properties can be obtained in multiple ways, as they hold essential information about Android on your device. One method is to inspect the `build.prop` files, which will always be located in `/system`, `/system_ext` and `/vendor` folders. You can pull them from the device itself or one of its update packages.

Another way is to use `getprop` while in `adb shell`. It will print most properties, both build and runtime, about the device. This can be saved in a text file.

The most important properties you will need will typically be the following:
* `ro.product.manufacturer`: This is the manufacturer's name, and what you will use as the **vendor** name.
* `ro.product.device`: This is the device **codename**. It is typically never the same as the marketed name (e.g. "instantnoodle" is the codename for the "OnePlus 8").

{% include alerts/note.html content="There are other properties that you may need that do not start with `ro.product`. Keep that in mind as you do your work." %}

### Determining the partition layout

All of the data on your device are divided up and stored in unique areas called "partitions". These partitions are laid out in a specific way to make your device work the way that it does.

You must determine the partition layout of your device before you replace the stock operating system. Just inspecting the `fstab` file alone (often located in `/vendor/etc`) is often not enough to make a determination.

You can get a list of partitions by running the following command in `adb shell`:

```sh
$ ls /dev/block/bootdevice/by-name
```

More information regarding partitions can be found on the AOSP [architecture](https://source.android.com/docs/core/architecture/partitions) and [updates](https://source.android.com/docs/core/ota) sections.

You can also get these partitions by using `fastboot`. Assuming your device supports it, you can reboot into bootloader (often with `adb reboot bootloader`) and run the following command:

```sh
$ fastboot getvar all
```

Once again, make sure this information is in some place you can refer back to easily.

## Setting up directories

Once you believe you have gathered enough information about your device, you can start setting up the directories for your device. They will often be referred to as **"trees"** in this guide.

In general, you will need to create three directories:
* `device/<vendor>/<codename>` - The device configuration goes here. This is where most of your work will take place.
* `kernel/<vendor>/<chipset>` - The kernel source code you obtained goes here.
* `vendor/<vendor>/<codename>` - This directory contains proprietary blobs extracted from the device itself or one of its update packages. It will initially be empty.

Replace the values in the angled brackets appropriately, and make sure they are all lowercase and contain no spaces (e.g. `device/oneplus/instantnoodle`).

While you can create the device configuration files manually, we recommend you copy them from another device instead. This will serve as your starting point and reduce your overall workload. Using one from your device's vendor with similar hardware that we currently support is the most ideal.

All device trees can be found on [our GitHub](https://github.com/LineageOS). They follow the `android_device_<vendor>_<codename>` naming scheme. If you followed the build instructions for one of our supported devices, then you already know how to download them.

{% include alerts/tip.html content="If you have a GitHub account, fork the repository and then rename it. After that, add it as a project entry in `.repo/local_manifests/roomservice.xml` and resync your source code. Use the other entries in that file as a reference." %}

{% include alerts/important.html content="Read the `lineage.dependencies` file to see if you need other repositories. You may need to fork any device repositories listed. Kernel and hardware repositories do not need to be forked." %}

## Customizing files
{% include alerts/important.html content="Some device repositories rely on a common repository and have most of its configuration there. This is often done for devices that have the same underlying hardware and share the same kernel (e.g. OnePlus 8 and 8 Pro). If you do not intend to port multiple similar devices, you must merge the device and common repositories together." %}

Take a look at your device tree. It should contain the following:
* `Android.bp` - This defines the Soong namespace for your device, which is needed by the build system.
* `Android.mk` - This tells the build system to include all of the makefiles in your directory. For some devices, it may also include a few other tasks.
* `AndroidProducts.mk` - This adds your device as options in `lunch` and inherits a product makefile.
* `BoardConfig.mk` - This contains the build settings for your device. If any part of this file is wrong, LineageOS may not compile correctly for your device, if at all.
* `device.mk` - This contains instructions on which packages to build and what files to copy. It may even set some properties for how they should be built.
* `extract-files.py` and `setup-makefiles.py` - These two scripts extract files from the device or its update packages, and creates the makefiles for the vendor tree for your device. Refer to our guide on [extracting proprietary blobs]({{ "extracting_blobs_from_zips" | relative_url }}) on how to use the former script. The second script will often not be invoked by you directly.
* `lineage_<codename>.mk` - This is the product makefile. It is responsible for the identity of your device, but also tells the build system what type of product your device is (if it's a phone or tablet, if it's 64-bit, if it's Wi-Fi only, etc).
* `lineage.dependencies` - This is read by the build system to download any needed dependencies currently not present.
* `proprietary-files.txt` - This is a list of all proprietary blobs that must be extracted from the device or its update package. It may contain blobs that can be built from source, but require changes from your device's manufacurer that they have not made publicly available.

You will be modifying these files regularly as you develop your port.

### Organizing the device tree
How the device tree will be organized is up to you, but the files listed above should always be in the root directory. If you have other files, you can place them at the root or create subdirectories for them.

### Other files
Some other files you will need include, but are not limited to:
* `fstab` - Generally, `fstab.default` is what you're looking for, but some OEMs may use different `fstab` files. It's a good idea to test with the OEM one first and see if that is actually needed. This file must be correct, or you risk damaging your device (such as writing the wrong data to a critical partition).
* `manifest.xml` - This defines what HALs will be present in Android when it is built. Refer to [AOSP documentation](https://source.android.com/docs/core/architecture/vintf/objects) for more details.
* `.prop` - These files hold properties that influence how Android behaves. Depending on the property, they may be in `system.prop`, `vendor.prop` or `odm.prop`.

Some devices require a `modules.load` file, as their kernels may not have everything built-in, but instead have modules that exist outside of it.

Other device trees will obviously contain files not listed here, in which case, you can ask on our IRC or Discord server for help on what those ones are for.

## Actually building LineageOS

Once you are certain that you have your device, kernel and vendor trees setup, you can finally start compiling LineageOS. We will assume that you've already read the build instructions for any of our supported devices and can adapt it to your device instead.

You will likely encounter errors as you compile. Fixing these errors is simply a normal part of developing your port. Should you find yourself struggling to fix them, you can reach out on IRC or Discord for assistance. We will not be able to help if you do not provide sufficient information.

## Conclusion
Hopefully, this guide was helpful in getting you started on porting LineageOS to your device. We look forward to what you are able to accomplish!

If you manage to succeed, feel free to [submit your port](submitting_device.html)! Make sure you follow the requirements so you can do this successfully.
