---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---
## Introduction

Proprietary blobs can be extracted either from a device already running LineageOS or from a LineageOS installable zip. In this guide we will describe the steps required to extract proprietary files from installable zips.

Before beginning, it is required to know the difference between block-based OTAs and file-based OTAs. In a file-based OTA the content of the system partition is available inside a folder of the zip named `system`. In a block-based OTA the content of the system partition is stored inside of a file as binary data. If your zip has no `system` folder or an almost empty `system` folder, and a file named `system.transfer.list` in its root, then what you have is a block-based OTAs. Jump to [Extracting proprietary blobs from block-based OTAs](#extracting-proprietary-blobs-from-block-based-otas) in this case. If you have the entire content of the system partition inside the `system` folder and no `system.transfer.list`, then what you have is a file-based OTA. See [Extracting proprietary blobs from file-based OTAs](#extracting-proprietary-blobs-from-file-based-otas).

## Extracting proprietary blobs from block-based OTAs

Create a temporary directory and move there:

```
mkdir ~/android/system_dump/
cd ~/android/system_dump/
```

Run the ``extract-files.sh`` script inside the /device/$VENDOR/$DEVICE_CODENAME folder once with **wrong** parameters (we will execute it again with right parameters later); to get a list of needed files: 

```
./extract-files.sh ~/some-non-existent-folder 
```
This will return a list of files that we need to find. 

- If **all** of these file paths start with system (or /system), you don't have to extract the boot partition; so you can *skip the section "Prepare the boot partition files"* and you don't have to extract boot.img from the zip in the following. 
- If any of these file paths does **not** start with system (or /system), you have to extract the boot partition. 

Extract `system.transfer.list`, `system.new.dat` and `boot.img` from the installable LineageOS zip:

```
unzip path/to/lineage-*.zip system.transfer.list system.new.dat boot.img
```
where `path/to/` is the path to the installable zip.

### Prepare the system partition files

You now need to get a copy of `sdat2img`. This script can convert the contents of block-based OTA system images into dumps that can be mounted. `sdat2img` is available at the following git repository that you can clone with:

```
git clone https://github.com/xpirt/sdat2img
```

Once you have obtained `sdat2img`, use it to extract the system image:

```
python sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
```

You should now have a file named `system.img` that you can mount as follows:

```
mkdir system/
sudo mount system.img system/
```

### Prepare the boot partition files

Now, we have to take care of the `boot.img` file. It should include both the kernel and ramdisk, as you can see when running 
```
file boot.img
```

If the file is in some other format, please find a solution for the steps afterwards by yourself. 

First, we have to split it into these two parts. 
We can use the python script ``unpackbootimg`` at ``/system/core/mkbootimg/unpackbootimg``: 
```
unpackbootimg -i boot.img -o . 
```
(Don't leave away the dot)
This will unpack the contents of boot.img into the current directory. 
We should now have the RAM disk, compressed with 
- GZIP (.gz, .gzip) # or
- BZIP2 (.bzip2, .bz) # or
- LZMA (.lzma, .lzma2) # or
- XZ (.xz)

Let's decompress it: 
```
gunzip  boot.img-ramdisk.gz # or
bunzip2 boot.img-ramdisk.bz # or
lzma -d boot.img-ramdisk.lzma # or
xz -d   boot.img-ramdisk.xz
```

We get `boot.img-ramdisk`. This is the initrd. 

Now, you can extract the files from the cpio-init-RAM-disk file by running: 
```
cpio -i < boot.img-ramdisk
```


### Copy the needed system and ramdisk image files 

After you have mounted the system image and extracted the ramdisk files, move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```
This will tell `extract-files.sh` to get the files from the mounted system dump rather than from a connected device.

For some older device configurations, you might have to add the option `-d ` or `--path` before `~/android/system_dump/`; otherwise "extract_files.sh" will still look for an adb device. 

Once you've extracted all the proprietary files, unmount the system dump and delete the no longer needed files:

```
sudo umount ~/android/system_dump/system
rm -rf ~/android/system_dump/
```

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
