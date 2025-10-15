---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---
## Introduction

Create a temporary directory and move there:
```
mkdir -p ~/android/system_dump/
cd ~/android/system_dump/
```

Extract all files from the installable LineageOS zip:
```
unzip path/to/lineage-*.zip
```

If you are building LineageOS 22 or newer, move to the directory of your device:
```
cd ~/android/lineage/device/vendor_name/device_name/
```
Run `extract-files.py`:
```
./extract-files.py ~/android/system_dump/
```
And remove the temporary directory:
```
rm -rf ~/android/system_dump/
```

If you are building LineageOS 21 or older, continue with the rest of this guide.

Now, you need to determine the type of OTA for your device:

* **Block-based OTA**: the content is stored in `*.dat*` files as binary data.
* **File-based OTA**: the content is stored in the `system` directory.
* **Payload-based OTA**: the content is stored in `*.img` files inside `payload.bin`.

If your zip has `*.transfer.list` files, then you have a block-based OTA. Jump to [Extracting files from block-based OTAs](#extracting-files-from-block-based-otas).

If your zip has no `*.transfer.list` files and all files are in `system` directory, then you have a file-based OTA. All files are already extracted, jump to [Finishing](#finishing).

If your zip has a `payload.bin` file, then you have a payload-based OTA. Jump to [Extracting files from payload-based OTAs](#extracting-files-from-payload-based-otas).

## Extracting files from block-based OTAs

Some block-based OTAs are split into multiple files, each for separate partitions like system, vendor, product, oem, odm and others. You can verify if yours is split by looking for the corresponding `*.transfer.list` files for each in the root of the installable LineageOS zip.

If you have a split block-based OTA file, you will need to decompress, extract and mount each file as described below.

If files are compressed with [brotli](https://en.wikipedia.org/wiki/Brotli) `*.br`, you need to decompress them using the `brotli` utility:
```
sudo apt install brotli
brotli --decompress --output=system.new.dat system.new.dat.br
```

You now need to get a copy of `sdat2img`. This script can convert the content of block-based OTAs into dumps that can be mounted. `sdat2img` is available at the following git repository that you can clone with:
```
git clone https://github.com/xpirt/sdat2img.git
```

Once you have obtained `sdat2img`, use it to extract the system image:
```
sdat2img/sdat2img.py system.transfer.list system.new.dat system.img
```

You should now have a file named `system.img` that you can mount as follows:
```
mkdir -p system/
sudo mount -r system.img system/
```

Unlike the above, if you have a `super.img` file, you need to get a copy of `lpunpack` to extract images from it. This script can extract the content of the Super partition into it's respective component partitions that can be mounted. Luckily, `lpunpack` is easily buildable, executing the following from a LineageOS 17.1 or greater tree:
```
source build/envsetup.sh
breakfast your_device_codename
m lpunpack
```

Once you have built `lpunpack`, use it to extract the super image:
```
lpunpack super.img
```

Now jump to [Finishing](#finishing).

## Extracting files from payload-based OTAs

To use the payload.bin extractor you will need python3-protobuf, if you do not already have it:
```
sudo apt install python3-protobuf
```

Clone the repos needed to use the payload.bin extractor:
```
git clone https://github.com/LineageOS/android_prebuilts_extract-tools.git android/prebuilts/extract-tools
git clone https://github.com/LineageOS/android_tools_extract-utils.git android/tools/extract-utils
git clone https://github.com/LineageOS/android_system_update_engine.git android/system/update_engine
```

Now, extract the the `.img` files from payload.bin:
```
android/prebuilts/extract-tools/linux-x86/bin/ota_extractor --payload payload.bin
```

It will take a few moments. Once it's done, you will need to mount all images. First, mount `system.img`:
```
mkdir -p system/
sudo mount -r system.img system/
```

Then, mount all other images like this:
```
sudo mount -r name.img system/name/
```

## Finishing

Move to the root directory of the sources of your device `~/android/lineage/device/vendor_name/device_name/` and run `extract-files.sh` as follows:
```
./extract-files.sh ~/android/system_dump/
```

If you mounted any images, unmount them:
```
sudo umount -R ~/android/system_dump/
```
And remove the temporary directory:
```
rm -rf ~/android/system_dump/
```
