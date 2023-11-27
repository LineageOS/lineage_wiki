## EFS/Persist Backup

{% include alerts/warning.html content="Before processing repartition further we highly recommend you backup persist and EFS using adb or you might lose your IMEI/WIFI + BT mac addresses" %}
1. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
2. Now, use the volume buttons to select "Advanced", and then "Enable ADB".
3. Now open Terminal (Linux/macOS), or PowerShell (Windows), run `adb -d shell`, and then run the following commands within it:
    - `dd if=/dev/block/mmcblk0p2 of=/sdcard/modemst1.img`
    - `dd if=/dev/block/mmcblk0p3 of=/sdcard/modemst2.img`
    - `dd if=/dev/block/mmcblk0p4 of=/sdcard/persist.img`
    - `exit`
4. Now from that same Terminal/PowerShell, run:
    - `adb -d pull /sdcard/modemst1.img`
    - `adb -d pull /sdcard/modemst2.img`
    - `adb -d pull /sdcard/persist.img`
{% include alerts/note.html content="Make sure to store these somewhere safe in case later steps fail." %}

## Repartition
{% include alerts/warning.html content="This step is not optional, the device will not boot LineageOS without repartitioning first!" %}
{% include alerts/warning.html content="This process will wipe all data on the device, including your internal storage!" %}
1. Download the flashable repartition script from [here](https://download.ods.ninja/Android/firmware/flox/flo-deb_clamor_repartition_20201203.zip).
2. On your device's screen, choose "Apply Update", then "From ADB".
3. From your Terminal/PowerShell, run `adb -d sideload /path/to/flo-deb_clamor_repartition.zip`, filling `/path/to/` in with the path you downloaded the repartition zip to.
    {% include alerts/note.html content="The repartition script package in question isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
4. Now run `adb -d shell` from your Terminal/PowerShell, and run the following commands within it:
    - `modify`
    {% include alerts/warning.html content="This step may take up to 5 minutes, please ensure your USB connection/power source isn't interrupted during this time." %}
5. The device will complete the repartition process, please leave it sit for 10 minutes, and when you return it will have something resembling the following on screen::
```
2048+0 records in
2048+0 records out
1048576 bytes (1.0 M) copied, 0.106720 s, 9.3 M/s
32768+0 records in
32768+0 records out
16777216 bytes (16 M) copied, 0.546387 s, 29 M/s
```
6. So long as some variation of the previous messages are shown, proceed to hold the volume down and power keys until the device reboots to the bootloader, and then format your data partition:
```
fastboot -w
```
7. Flash recovery onto your device:
```
fastboot flash {{ device.recovery_partition_name }} {{ device.recovery_partition_name }}.img
```
    {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}
    {% include alerts/tip.html content="Some devices have buggy USB support while in bootloader mode, if you see `fastboot` hanging with no output when using commands such as `fastboot getvar ...`, `fastboot boot ...`, `fastboot flash ...` you may want to try a different USB port (preferably a USB Type-A 2.0 one) or a USB hub." %}
8. Now reboot into recovery to verify the installation:
    * {{ device.recovery_boot }}
9. Click,"Factory Reset", then "Format system partition", then when prompted, select "Yes".
10. Click,”Factory Reset”, then “Format cache partition”, then when prompted, select “Yes”.

