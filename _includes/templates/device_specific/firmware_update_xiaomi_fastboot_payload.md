{% include templates/device_specific/firmware_update_xiaomi_common.md %}
2. Extract firmware files from zip using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
   ```
   payload-dumper-go -o . miui_*.zip
   ```
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Run the following commands to flash firmware:
   ```
   {{- include.content -}}
   ```
5. Reboot:
   ```
   fastboot reboot
   ```
