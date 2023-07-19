## EFS/Persist Backup

{% include alerts/warning.html content="Before processing repartition further we highly recommend you backup persist and EFS using adb or you might lose your IMEI/WIFI + BT mac addresses" %}
1. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
2. Now, use the volume buttons to select "Advanced", and then "Enable ADB".
3. Now open Terminal (Linux/macOS), or PowerShell (Windows), run `adb shell`, and then run the following commands within it:
    - `dd if=/dev/block/sdd9 of=/tmp/modemst1.img`
    - `dd if=/dev/block/sdd10 of=/tmp/modemst2.img`
    - `dd if=/dev/block/sdd3 of=/tmp/persist.img`
    - `exit`
4. Now from that same Terminal/PowerShell, run:
    - `adb pull /tmp/modemst1.img`
    - `adb pull /tmp/modemst2.img`
    - `adb pull /tmp/persist.img`
{% include alerts/note.html content="Make sure to store these somewhere safe in case later steps fail." %}

## Repartition
{% include alerts/warning.html content="This step is not optional, the device will not boot LineageOS without repartitioning first!" %}
{% include alerts/warning.html content="This process will wipe all data on the device, including your internal storage!" %}
1. Download the flashable repartition script from [here](https://download.ods.ninja/Android/firmware/m1s1/repartition-ogpixel-32gb.zip) for 32 GB models, and [here](https://download.ods.ninja/Android/firmware/m1s1/repartition-ogpixel-128gb.zip) for 128 GB models.
2. Rename the downloaded zip file to `repartition.zip`.
3. On your device's screen, choose "Apply Update", then "From ADB".
4. From your Terminal/PowerShell, run `adb sideload /path/to/repartition.zip`, filling `/path/to/` in with the path you downloaded the repartition zip to.
    {% include alerts/note.html content="The repartition script package in question isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
    {% include alerts/warning.html content="This step may take up to 5 minutes, please ensure your USB connection/power source isn't interrupted during this time." %}
5. The device will complete the repartition process, and will display `Done!` on-screen, at this point please select "Advanced" then "Reboot to Recovery", then proceed with the installation process. 
