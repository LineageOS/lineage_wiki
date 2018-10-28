{% capture custom_downgrade_instructions %}

## Installing the LineageOS boot image and repartitioning via `heimdall`

i9100 is slightly different compared to other devices. Two things have to be done before installing a custom recovery:
* **An ISORec Compatible Boot Image Must Be Flashed**: Unlike normal (non-A/B) devices that have a specific partition for recovery, i9100 has recovery stored in the boot image. ISORec is a workaround that points the device's bootloader to another partition for recovery. This works, however it needs to be built into the boot image. The LineageOS boot image supports this. Normally the boot image will be installed in recovery along with the rest of the ROM, but as we need the boot image to boot recovery, instructions to flash it with Heimdall are outlined below.
* **Device Must be Repartitioned**: By default the `/system` partition on i9100 is too small for LineageOS. If you went to flash LineageOS without repartitioning, you would run out of space. Repartitioning will increase the `/system` partition slightly while decreasing some others.
{% if device.maintainers != empty %}
1. Download the [LineageOS install package](https://download.lineageos.org/{{ device.codename }}) that you'd like to install or [build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) the package yourself.
{% else %}
1. [Build]({{ "devices/" | append: device.codename | append: "/build" | relative_url }}) a LineageOS install package.
{% endif %}
2. Extract the LineageOS zip file. Specifically you need the `boot.img` file from it. Keep the original zip file as you will need it later.
3. Download the [PIT file](https://androidfilehost.com/?fid=24591000424954843) to use for repartitioning. Credit to the.gangster for creating the file.
4. Power off the your device and connect the USB adapter to the computer (but not to the device, yet).
5. Boot into download mode:
    * {{ site.data.devices[page.device].download_boot }}
    Accept the disclaimer, then insert the USB cable into the device.
6. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window in the directory the files are located, and type:    
    ```
    heimdall flash --repartition --pit I9100_1.5GB-System_6GB-Data_512MB-Preload_by-the.gangster.pit --KERNEL boot.img
    ```
    {% include tip.html content="The files may not be named identically to what's in this command. If the file is wrapped in a zip or tar file, extract the file first, because Heimdall isn't going to do it for you." %}    
7. A blue transfer bar will appear on the device showing the files being transferred, then your device will reboot.
8. After flashing, your device will not be able to boot normally. Do not panic, this is normal. The device can be rebooted by holding both volume buttons and power, when it reboots you can do the standard key combo to get back into download mode. Once there, proceed with the rest of the instructions.
{% endcapture %}
