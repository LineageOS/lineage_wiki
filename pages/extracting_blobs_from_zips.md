---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---
## Introduction

Proprietary blobs can be extracted either from a device already running LineageOS or from a LineageOS installable zip. In this guide we will describe the steps required to extract proprietary files from installable zips.

Before beginning, it is required to know the difference between different types of OTAs:

* **Block-based OTA**: the content of the system partition is stored inside of an `.img` file as binary data.

* **Project Treble enabled block-based OTA**: the content of the system partition and vendor partition are each stored  inside of a seperate `.img` file as binary data.

* **File-based OTA**: the content of the system partition is available inside a folder of the zip named `system`. 

* **Payload-based OTA**: the content of the system partition is stored as an `.img` file inside of `payload.bin`.

If your zip has no `system` folder or an almost empty `system` folder, a file named `system.transfer.list` in its root, and not file named `vendor.transfter.list` in its root, then what you have is a block-based OTAs. Jump to [Extracting proprietary blobs from block-based OTAs](#extracting-proprietary-blobs-from-block-based-otas) in this case.

If your zip has no `system` folder or an almost empty `system` folder, and a file named `system.transfer.list` in its root, as well as a similar missing `system/vendor` folder or almost empty `system/vendor` folder, and a file named `vendor.transfer.list` in its root, then what you have is a Project Treble enabled block-based OTAs. Jump to [Extracting proprietary blobs from Project Treble enabled block-based OTAs](#extracting-proprietary-blobs-from-project-treble-enabled-block-based-otas) in this case.

If you have the entire content of the system partition inside the `system` folder and no `system.transfer.list`, then what you have is a file-based OTA. See [Extracting proprietary blobs from file-based OTAs](#extracting-proprietary-blobs-from-file-based-otas). 

You may also have a payload-based OTA, which is what your device will use if it uses the A/B partitioning system. If that is what you have, jump to [Extracting proprietary blobs from payload-based OTAs](#extracting-proprietary-blobs-from-payload-based-otas).

## Extracting proprietary blobs from block-based OTAs

Create a temporary directory and move there:

```
mkdir ~/android/system_dump/
cd ~/android/system_dump/
```

Extract `system.transfer.list` and `system.new.dat.br` or `system.new.dat` from the installable LineageOS zip:

```
unzip path/to/lineage-*.zip system.transfer.list system.new.dat*
```
where `path/to/` is the path to the installable zip.

In case `system.new.dat.br` (a [brotli](https://en.wikipedia.org/wiki/Brotli) archive) exists, you will first need to decompress it using the `brotli` utility:

```
sudo apt-get install brotli
brotli --decompress --output=system.new.dat system.new.dat.br
```

You now need to get a copy of `sdat2img`. This script can convert the content of block-based OTAs into dumps that can be mounted. `sdat2img` is available at the following git repository that you can clone with:

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

After you have mounted the image, move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```
This will tell `extract-files.sh` to get the files from the mounted system dump rather than from a connected device.

Once you've extracted all the proprietary files, unmount the system dump and delete the no longer needed files:

```
sudo umount ~/android/system_dump/system
rm -rf ~/android/system_dump/
```

## Extracting proprietary blobs from Project Treble enabled block-based OTAs

Create a temporary directory and move there:

```
mkdir ~/android/system_dump/
cd ~/android/system_dump/
```

Extract the system and vendor files from the installable LineageOS zip:

```
unzip path/to/lineage-*.zip system.transfer.list vendor.transfer.list system.new.dat* vendor.new.dat*
```
where `path/to/` is the path to the installable zip.

In case `system.new.dat.br` and `vendor.new.dat.br` (a [brotli](https://en.wikipedia.org/wiki/Brotli) archive) exists, you will first need to decompress it using the `brotli` utility:

```
sudo apt-get install brotli
brotli --decompress --output=system.new.dat system.new.dat.br
brotli --decompress --output=vendor.new.dat vendor.new.dat.br
```

You now need to get a copy of `sdat2img`. This script can convert the content of block-based OTAs into dumps that can be mounted. `sdat2img` is available at the following git repository that you can clone with:

```
git clone https://github.com/xpirt/sdat2img
```

Once you have obtained `sdat2img`, use it to extract the system and vendor image:

```
python sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
python sdat2img/sdat2img.py vendor.transfer.list vendor.new.dat vendor.img
```

You should now have two files named `system.img` and `vendor.img` that you can mount as follows:

```
mkdir system/
sudo mount system.img system/
sudo rm system/vendor
sudo mkdir system/vendor
sudo mount vendor.img system/vendor/
```

After you have mounted the image, move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```
This will tell `extract-files.sh` to get the files from the mounted system dump rather than from a connected device.

Once you've extracted all the proprietary files, unmount the system and vendor dumps and delete the no longer needed files:

```
sudo umount ~/android/system_dump/system/vendor
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

## Extracting proprietary blobs from payload-based OTAs

Create a temporary directory to extract the content of the zip and move there:

```
mkdir ~/android/system_dump/
cd ~/android/system_dump/
```

Extract the `payload.bin` file from the LineageOS installation zip file:

```
unzip /path/to/lineage-*.zip payload.bin
```
where `/path/to/` is the path to the installable zip.

You will now need to use a tool called `update-payload-extractor`.

To use the tool, you will need python-protobuf, if you do not already have it:

```
sudo apt-get install python-protobuf
```

You can now extract the `.img` files from the payload:

* If you have a LineageOS build tree checked out already, you can just run the script to extract the payload:
  ```
  python /path/to/lineage-tree/lineage/scripts/update-payload-extractor/extract.py payload.bin --output_dir ./
  ```

* If you don't have a LineageOS build tree checked out, you can clone our scripts repo, and then run the script to extract the payload:
  ```
  git clone https://github.com/LineageOS/scripts
  python /path/to/scripts/update-payload-extractor/extract.py payload.bin --output_dir ./
  ```

It will take a few moments. Once it's done, we will need to mount the `system.img` file, and the `vendor.img` and `product.img` files if they exist, to obtain the complete set of proprietary blobs:

```
mkdir system/
sudo mount system.img system/
sudo mount vendor.img system/vendor/
sudo mount product.img system/product/
```

Move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```

This will tell `extract-files.sh` to extract the proprietary blobs from the mounted system dump rather than a connected device.

Once it is done, unmount the system dump and remove the now unnecessary files:

```
sudo umount -R ~/android/system_dump/system/
rm -rf ~/android/system_dump/
```
