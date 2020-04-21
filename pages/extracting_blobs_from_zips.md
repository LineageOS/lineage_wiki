---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---
## Introduction

Proprietary blobs can be extracted either from a device already running LineageOS or from a LineageOS installable zip. In this guide we will describe the steps required to extract proprietary files from installable zips.

Before beginning, it is required to know the difference between the types of OTAs:

* **Block-based OTA**: the content of the system partition is stored inside of an `.dat`/`.dat.br` file as binary data.

* **File-based OTA**: the content of the system partition is available inside a folder of the zip named `system`.

* **Payload-based OTA**: the content of the system partition is stored as an `.img` file inside of `payload.bin`.

If your zip has no `system` folder or it is nearly empty and a file named `system.transfer.list` exists at the root level, then what you have is a block-based OTA. Jump to [Extracting proprietary blobs from block-based OTAs](#extracting-proprietary-blobs-from-block-based-otas) in this case.

If you have the entire content of the system partition inside the `system` folder and no `system.transfer.list`, then what you have is a file-based OTA. See [Extracting proprietary blobs from file-based OTAs](#extracting-proprietary-blobs-from-file-based-otas).

You may also have a payload-based OTA, which is what your device will use if it uses the A/B partitioning system. If that is what you have, jump to [Extracting proprietary blobs from payload-based OTAs](#extracting-proprietary-blobs-from-payload-based-otas).

## Extracting proprietary blobs from block-based OTAs

Some block-based OTAs are split into multiple files, for the system partition and the other partitions like vendor, product, oem, odm and others.  You can verify if yours is split by looking for the corresponding `*.transfer.list` files for each in the root of the installable LinageOS zip.

If you have a split block-based OTA file then you will need to extract, decompress and convert each one in a similar manner to system and vendor as outlined below.

If you do not have a split OTA file, you may skip any step that references `vendor.transfer.list` and `vendor.new.dat.br` or `vendor.new.dat`

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

If your OTA includes `vendor.transfer.list` and `vendor.new.dat.br` or `vendor.new.dat` (other others), extract them from the installable LineageOS zip as well:

```
unzip path/to/lineage-*.zip vendor.transfer.list vendor.new.dat*
```
where `path/to/` is the path to the installable zip.

In the case of `system.new.dat.br`/`vendor.new.dat.br`/etc. (a [brotli](https://en.wikipedia.org/wiki/Brotli) archive) exists, you will first need to decompress them using the `brotli` utility:

```
sudo apt-get install brotli
brotli --decompress --output=system.new.dat system.new.dat.br
```

And if you have a `vendor.dat.new.br` (or others) file:

```
brotli --decompress --output=vendor.new.dat vendor.new.dat.br
```

You now need to get a copy of `sdat2img`. This script can convert the content of block-based OTAs into dumps that can be mounted. `sdat2img` is available at the following git repository that you can clone with:

```
git clone https://github.com/xpirt/sdat2img
```

Once you have obtained `sdat2img`, use it to extract the system image:

```
python sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
```

And if you have a `vendor.dat.new` (or others) file:

```
python sdat2img/sdat2img.py vendor.transfer.list vendor.new.dat vendor.img
```

You should now have a file named `system.img` that you can mount as follows:

```
mkdir system/
sudo mount system.img system/
```

If you also have a file named `vendor.img`, you can mount it as follows:

```
sudo rm system/vendor
sudo mkdir system/vendor
sudo mount vendor.img system/vendor/
```

You must also now mount any other image files that you have in their respective directories.

After you have mounted the image(s), move to the root directory of the sources of your device and run `extract-files.sh` as follows:

```
./extract-files.sh ~/android/system_dump/
```

This will tell `extract-files.sh` to get the files from the mounted system dump rather than from a connected device.

Once you've extracted all the proprietary files, unmount the vendor dump if you mounted it earlier:

```
sudo umount ~/android/system_dump/system/vendor
```

Then unmount the system dump:

```
sudo umount ~/android/system_dump/system

```

Finally, unmount any other images before deleting the no longer needed files:

```
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
