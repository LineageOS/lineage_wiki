{% capture custom_downgrade_instructions %}

In order to root your device you must first install this kernel via Heimdall.

1. Download the [kernel](https://www.androidfilehost.com/?fid=745425885120732538)
    {% include tip.html content="If the file is wrapped in a zip or tar file, extract the file first, because Heimdall isn't going to do it for you." %}
2. Power off the your device and connect the USB adapter to the computer (but not to the device, yet).
3. Boot into download mode:

    * {{ site.data.devices[page.device].download_boot }}

    Accept the disclaimer, then insert the USB cable into the device.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window in the directory the recovery image is located, and type:
```
heimdall flash --BOOT boot.img
```
    {% include tip.html content="The file may not be named identically to what's in this command. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall isn't going to do it for you." %}
5. A blue transfer bar will appear on the device showing the kernel being transferred, then your device will reboot.
6. Allow it to boot and proceed with the rooting steps.
{% endcapture %}

{% capture custom_root_instructions %}

1. Download [motochopper](https://www.androidfilehost.com/?fid=24052804347757453) (credit to djrbliss).
   * md5: a2a361dc1a1122b9034d4be4ba355a46
2. Extract all files in the zip.
3. Run motochopper to achieve root.
   * **Windows**: run the run.bat file.
   * **Linux/macOS**: run the run.sh file.
4. You now have root, proceed to next section.
{% endcapture %}
