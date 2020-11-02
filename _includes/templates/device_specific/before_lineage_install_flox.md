## Install repartition package before installing ROM. Do not install ROM without repartition!

## Backup
# Before processing further we highly recommend you backup persist and EFS using adb
# Or you might lose your IMEI/WIFI + BT mac addresses
1. Boot into recovery and run commands in command line:

adb root
adb shell
dd if=/dev/block/mmcblk0p2 of=/sdcard/modemst1.img
dd if=/dev/block/mmcblk0p3 of=/sdcard/modemst2.img
dd if=/dev/block/mmcblk0p4 of=/sdcard/persist.img

Now you can find 3 *.img files at path /sdcard. Copy them to your PC since internal memory will be erased.

## Repartition
1. Boot into recovery (You need to allow system partition modification to be able resize /system in recovery).
2. Backup your data & Move your files from flash to your PC.
3. Flash repartition pack zip from: https://forum.xda-developers.com/devdb/project/dl/?id=30499
4. Do the actions asked by repartition pack (go to Terminal in ordinary recovery and input word that pack will tell you. Everything else will be done automatically).
5. Tablet will reboot into recovery.
6. Install TWRP from: https://androidfilehost.com/?fid=10763459528675570989
7. Format everything. (mount errors will not affect formatting!)
    - In TWRP: Wipe > Format data
    - Type yes
    - Once this completes go to: Wipe > Advanced Wipe
    - Tick all the boxes and wipe. There should be no further mount errors.
8. Install ROM.
