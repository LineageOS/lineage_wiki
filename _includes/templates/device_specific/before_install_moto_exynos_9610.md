{% include templates/device_specific/before_install_needs_specific_android_fw.md %}

## Unlocking the bootloader

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}

1. Connect the device to your PC via USB.
2. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot bootloader
```
    {% if device.download_boot %}
    You can also boot into fastboot mode via a key combination:

    * {{ device.download_boot }}
    {% endif %}
3. Once the device is in fastboot mode, verify your PC finds it by typing:
```
fastboot devices
```
    {% include alerts/tip.html content="If you see `no permissions fastboot` while on Linux or macOS, try running `fastboot` as root." %}

4. Follow the instructions at [Motorola Support](http://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-a) to unlock your bootloader.

    {% include alerts/note.html content="If your device is not supported by the Motorola Bootloader Unlock website, you may be able to use an alternative bootloader unlock method like [SunShine](http://theroot.ninja/), though they only support some devices/firmwares." %}

5. Since the device resets completely, you will need to re-enable USB debugging to continue.

## Flashing a disabled VBMeta image

{% include alerts/warning.html content="This device requires a disabled VBMeta image to be flashed prior to booting or flashing anything custom, the process to do so is described below." %}

1. Download [this](https://androidfilehost.com/?fid=2188818919693795292) `vbmeta.img` file.
2. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
3. Flash a disabled VBMeta image on your device by typing:
```
fastboot flash vbmeta vbmeta.img
```
    {% include alerts/note.html content="Outdated fastboot releases dropped legacy A/B support, so it might attempt to flash to `boot__a` / `boot__b` rather than `boot_a` / `boot_b` if you try to flash `boot`. In this case, you must update `fastboot` to the a release newer than or equal to `31.0.2`. Alternatively, you can manually specify which slot to flash to based on what slot fastboot failed to flash to. For example, if fastboot fails to flash to `boot__a`, you must flash to `boot_a`." %}

{% include templates/device_specific/before_lineage_install_ab_copy_partitions.md %}
