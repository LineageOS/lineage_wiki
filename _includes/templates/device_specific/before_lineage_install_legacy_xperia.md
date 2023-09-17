## Repartitioning

{% include alerts/warning.html content="This step is not optional, the device will not boot LineageOS without repartitioning first!" %}
{% include alerts/warning.html content="This process will wipe all data on the device, including your internal storage!" %}
1. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
2. Download [unify_userdata.zip](https://mega.nz/folder/mttySaCY#IcRH1F_xeBdK_i1gpTOjqg).
3. On the device, select "Advanced", then "ADB Sideload" and swipe to proceed.
4. Open Terminal (Linux/macOS), or PowerShell (Windows), run the following command within it:
```
adb sideload /path/to/unify_userdata.zip
```
    {% include alerts/tip.html content="The file path will not be named identically to what stands in this command, so adjust accordingly." %}
5. This will display a warning and then exit. At this point, to confirm the action please repeat steaps 3 & 4.
