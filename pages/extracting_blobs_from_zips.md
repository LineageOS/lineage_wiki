---
sidebar: home_sidebar
title: Extracting proprietary blobs from LineageOS zip files
permalink: extracting_blobs_from_zips.html
---

Move to the directory of your device:
```
cd ~/android/lineage/device/vendor_name/device_name/
```

If the device directory contains `extract-files.py`, run it with:
```
./extract-files.py path/to/lineage-*.zip
```
Otherwise, follow [this guide](extracting_blobs_from_zips_manually.html).
