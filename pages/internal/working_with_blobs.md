---
sidebar: home_sidebar
title: Working with proprietary blobs
folder: internal
permalink: proprietary_blobs.html
search: exclude
tags:
 - internal
---

## Working with proprietary blobs

All devices should have a list of proprietary blobs in their device tree called ```proprietary-files.txt```.  This list is used to create the vendor repository for building the device by extracting blobs from a device running the latest copy of LineageOS and/or from a system dump.  Generally devices need only one list of blobs although you may encounter devices that have both ```proprietary-files.txt``` and ```proprietary-files-qc.txt``` (or more).  There is no need to split the files and the reason for the split is largely historical at this point.

To start, copy the appropriate ```extract-files.sh``` and ```setup-makefiles.sh``` templates from ```tools/extract-utils/templates``` (```vendor/lineage/build/templates``` on LineageOS 17.1 and older) to your device tree and edit them to fill in the three required fields (device, vendor and copyright year).

The contents of ```proprietary-files.txt``` is a list of blobs with optional comments (lines beginning with ```#```).  Each blob line is of the form:

```
[-]source[:destination][|sha1sum]
```

Each filename is relative to the system partition.  The entry ```vendor/lib/libblob.so``` will be extracted from and later installed to ```/system/vendor/lib/libblob.so```.  Example of all the variations that you write are:

```
libbasic.so
-libneeded-to-build.so
libsource.so:libdestination.so
-libneeded-source.so:libneeded-destination.so
libstock.so|sha1sum
-libstock-needed.so|sha1sum
-libstock-source.so:libstock-destination.so|sha1sum
```

If the entry begins with a dash (```-```) then the vendor repository will declare a module that provides the blob.  This is needed if the blob is used to build another component in Android.  If the dash does not exist then the blob will simply be copied during the build.

If the entry has a colon (```:```) with ```source``` and ```destination``` names, the extractor will check to see if the destination file exists.  If the destination file exists it will be extracted.  If not, the source filename will be extracted but saved to the destination name.  This allows you to pull either from a stock (unrenamed) dump or a Lineage dump/device while renaming it.

The ```sha1sum```, is the checksum of the version of the blob that we want to "pin".  If the copy of that blob in the existing vendor tree does not match the ```sha1sum``` then it is ignored and extraction proceeds normally.  If it does match then it will be kept regardless of the contents of the device/dump you are pulling from.

{% include alerts/tip.html content="
The sha1sum is very useful if you are going to update your blobs from a stock image when you have kanged blobs from other devices.  If you list the sha1sums of any kanged or hexedited (aka non-stock) blobs, then you can always update the stock blobs without fear of losing your customizations.
" %}

{% include alerts/tip.html content="
If you hexedit a blob or pull kang it from another device, you will need to update the ```proprietary-files.txt``` list to update the ```sha1sum```.  Please take the time to document the source of the kang or steps to reproduce the hexediting.
" %}

If you extract an app (```*.apk```) or jar file from an odexed system dump (aka, has boot.oats) and the app/jar does not already contain a classes.dex, it will be automatically de-odexed when extracted.
