---
sidebar: home_sidebar
title: Install LineageOS on pioneer
folder: install
permalink: /devices/pioneer/install
device: pioneer
---
{% include templates/device_install.md %}
note_content: '**Partitions mismatch**: It could happen that some partitions of the B slot are empty causing system malfunctions.
To fix this, you have to run the following commands in a root shell (e.g. TWRP shell):
```
dd if=/dev/block/bootdevice/by-name/bluetooth_a of=/dev/block/bootdevice/by-name/bluetooth_b
dd if=/dev/block/bootdevice/by-name/dsp_b of=/dev/block/bootdevice/by-name/dsp_b
dd if=/dev/block/bootdevice/by-name/modem_a of=/dev/block/bootdevice/by-name/modem_b
```
(source: https://forum.xda-developers.com/showpost.php?p=77317286&postcount=305)'
