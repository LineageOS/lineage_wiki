{% include templates/device_specific/firmware_update_xiaomi_common.md %}
2. Extract firmware files from zip
   ```
   unzip -qq miui_*.zip firmware-update/*
   cd firmware-update
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

{% include snippets/fw_update_success.md %}
