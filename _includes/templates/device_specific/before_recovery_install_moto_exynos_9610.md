## Flashing compatible firmware

{% include alerts/warning.html content="This device requires a disabled VBMeta image to be flashed prior to booting or flashing anything custom, the process to do so is described below." %}

1. Download [this](https://androidfilehost.com/?fid=2188818919693795292) `vbmeta.img` file.
2. Download [this](https://androidfilehost.com/?fid=14943124697586341251) `dtbo.img` file.
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Flash a the downloaded images to your device by typing:
```
fastboot flash vbmeta vbmeta.img
fastboot flash dtbo dtbo.img
```
    {% include alerts/note.html content="Outdated fastboot releases dropped legacy A/B support, so it might attempt to flash to `boot__a` / `boot__b` rather than `boot_a` / `boot_b` if you try to flash `boot`. In this case, you must update `fastboot` to the a release newer than or equal to `31.0.2`. Alternatively, you can manually specify which slot to flash to based on what slot fastboot failed to flash to. For example, if fastboot fails to flash to `boot__a`, you must flash to `boot_a`." %}
