<!--
    gtowifi flatly refuses to flash vbmeta properly via Odin, but it will happily install Lineage recovery just fine...
    So let's just do it here.
-->
## Disabling VBMeta

1. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
1. Download `vbmeta.img` from the directory named with the latest date from [here](https://mirror.math.princeton.edu/pub/lineageos/full/{{ device.codename }}/).
1. On the device, select "Advanced", then select "Enable ADB".
1. In a terminal or command prompt, run `adb push vbmeta.img /tmp/vbmeta.img`.
1. In the same terminal, run `adb shell dd if=/tmp/vbmeta.img of=/dev/block/bootdevice/by-name/vbmeta`.
