---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---
## Introduction

Proprietary blobs can be extracted either from a device already running LineageOS or from a LineageOS installable zip. In this guide we will describe the steps required to extract proprietary files from installable zips.

Before beginning, it is required to know the difference between block-based OTAs and file-based OTAs. In a file-based OTA the content of the system partition is available inside a folder of the zip named `system`. In a block-based OTA the content of the system partition is stored inside of a file as binary data. If your zip has no `system` folder or an almost empty `system` folder, and a file named `system.transfer.list` in its root, then what you have is a block-based OTAs. Jump to [Extracting proprietary blobs from block-based OTAs](#extracting-proprietary-blobs-from-block-based-otas) in this case. If you have the entire content of the system partition inside the `system` folder and no `system.transfer.list`, then what you have is a file-based OTA. See [Extracting proprietary blobs from file-based OTAs](#extracting-proprietary-blobs-from-file-based-otas).

## Extracting proprietary blobs from block-based OTAs


Just run the ./extract_files.sh script with your zip file as first argument: 
```
$LINEAGEOS_ROOT/device/$VENDOR/$DEVICE/extract_files.sh $ZIP_FILE
```
- If anything fails, have a look in the source code of this bash script and inside the function extract of ``$LINEAGEOS_ROOT/vendor/cm/build/tools/extract_utils.sh ``. 
- If the script does not exist (might be the case for older devices), have a look in the extract_files.sh script of other devices and create the script by yourself.


## Extracting proprietary blobs from file-based OTAs

Create a temporary directory to extract the content of the zip and move there:

```
mkdir ~/android/system_dump/
cd ~/android/system_dump/
```

Extract the `system` folder from the zip:

```
unzip path/to/lineage-*.zip system/*
```
where `path/to/` is the path to the installable zip.

After you have extracted the `system` folder, move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```
This will tell `extract-files.sh` to get the files from the extracted system dump rather than from a connected device.

Once you've extracted all the proprietary files, you can delete the files that were extracted from the zip:

```
rm -rf ~/android/system_dump/
```
