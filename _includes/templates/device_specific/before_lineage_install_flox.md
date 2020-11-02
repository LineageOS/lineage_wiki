https://www.androidfilehost.com/?fid=10763459528675595998https://www.androidfilehost.com/?fid=10763459528675595998https://www.androidfilehost.com/?fid=10763459528675595998
flo-deb_clamor_repartition_20201203.zip## EFS/Persist Backup

{% include alerts/warning.html content="Before processing repartition further we highly recommend you backup persist and EFS using adb or you might lose your IMEI/WIFI + BT mac addresses" %}
1. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
2. Now, use the volume buttons to select "Advanced", and then "Enable ADB".
3. Now open Terminal (Linux/macOS), or PowerShell (Windows), run `adb shell`, and then run the following commands within it:
    - `dd if=/dev/block/mmcblk0p2 of=/sdcard/modemst1.img`
    - `dd if=/dev/block/mmcblk0p3 of=/sdcard/modemst2.img`
    - `dd if=/dev/block/mmcblk0p4 of=/sdcard/persist.img`
    - `exit`
4. Now from that same Terminal/PowerShell, run:
    - `adb pull /sdcard/modemst1.img`
    - `adb pull /sdcard/modemst2.img`
    - `adb pull /sdcard/persist.img`
{% include alerts/note.html content="Make sure to store these somewhere safe in case later steps fail." %}

## Repartition
{% include alerts/warning.html content="This step is not optional, the device will not boot LineageOS without repartitioning first!" %}
{% include alerts/warning.html content="This process will wipe all data on the device, including your internal storage!" %}
1. Download the flashable repartition script from [here](https://androidfilehost.com/?fid=10763459528675590016).
2. On your device's screen, choose "Apply Update", then "From ADB".
3. From your Terminal/PowerShell, run `adb sideload /path/to/flo-deb_clamor_repartition.zip`, filling `/path/to/` in with the path you downloaded the repartition zip to.
    {% include alerts/warning.html content="This step may take up to 5 minutes, please ensure your USB connection/power source isn't interrupted during this time." %}
4. Now run `adb shell` from your Terminal/PowerShell, and run the following commands within it:
    - `modify`
5. Click,"Factory Reset", then "Format system partition", then when prompted, select "Yes".