## Forcibly unlocking the bootloader

 1. Run the following command to ascertain the device's current bootloader lock state:
 ```
 fastboot getvar unlocked
 ```
 2. If your device reports `unlocked: yes`, skip the remainder of this section and proceed to the step labeled "Flashing the dtb and dtbo partitions".
 3. If your device reports `unlocked: no`, power off the device, and boot it into burn mode by holding the pairing button on the side of the device while connecting to you host machine.
 4. Run the following commands on your host machine:
 ```
 wget https://github.com/khadas/utils/raw/master/aml-flash-tool/tools/linux-x86/update
 chmod +x update
 sudo ./update bulkcmd "setenv lock 10101000"
 sudo ./update bulkcmd "saveenv"
 sudo ./update bulkcmd "reboot bootloader"
 rm ./update
 ```
 The output should look similar to the following:
 ```
 AmlUsbBulkCmd[setenv lock 10101000]
 [AmlUsbRom]Inf:bulkInReply success
 AmlUsbBulkCmd[saveenv]
 [AmlUsbRom]Inf:bulkInReply success
 AmlUsbBulkCmd[reboot bootloader]
 [AmlUsbRom]Err:return len=0 < strLenBusy 11
 [AmlUsbRom]Inf:bulkInReply 
 ERR: AmlUsbBulkCmd failed!
 ```
 {% include alerts/note.html content="Please note that the failure of the final command is expected, and your device should now be booted into fastboot mode." %}
 5. Re-run the following command to ascertain the device's current bootloader lock state:
 ```
 fastboot getvar unlocked
 ```
 {% include alerts/warning.html content="Please only proceed if the status returns are `unlocked: yes`, if for some reason at this point it does not, please re-run the above to confirm it ran successfully, if it looks to have succeeded but reports `unlocked: no`, your device likely is not bootloader unlockable and you cannot run LineageOS." %}

## Flashing the dtb and dtbo partitions

 {% include alerts/warning.html content="This platform requires the dtb and dtbo partitions to be flashed for recovery to work properly, the process to do so is described below." %}

 1. Download dtbo file from [here](https://download.lineageos.org/devices/{{ device.codename }}), and dtb file from [here](https://download.ods.ninja/Android/firmware/{{ device.codename }}/dtb), Rename the dtb to dtb.img.
 2. Reboot the device into bootloader mode:
     * {{ device.download_boot }}
 3. Flash the downloaded image files to your device by running:
 ```
 fastboot flash dtb dtb.img
 fastboot flash dtbo dtbo.img
 ```
