## Important Information Before Flashing LineageOS

In order to ensure fingerprint sensor functionality in LineageOS build, the Samsung bootloader (S-BOOT) and baseband firmware (MODEM) needs to be upgraded to the latest available stock firmware T805ZHU1CQB1 via ODIN or Heimdall.

1. Download latest ODIN or Heimdall and required USB drivers
   (see instructions for Heimdall below) and install them

2. Download the modem_sboot_T805ZHU1CQB1.tar:

   * Link:            [http://sendfile.su/1441781](http://sendfile.su/1441781)
   * MD5 hashsum:     a4e2eb49813553964765d12cc7b2386b
   * SHA-1 hashsum:   5e6081e1fcd5108d64c14f3bd9cded398fa22046
   * SHA-256 hashsum: d9bb21873b45106fb6c61055903cc3f387006d884ed63c5f18ab3f99e117be6f

3. Boot into Download mode

   * {{ site.data.devices[page.device].download_boot }}

4. Update S-BOOT and MODEM

   a) For ODIN: 

     * Start ODIN
     * Select the "modem_sboot_T805ZHU1CQB1.tar" as AP
     * Start button to flash the correct partitions

   b) For Heimdall: 

     * Unpack the modem_sboot_T805ZHU1CQB1.tar using [7-Zip](https://www.7-zip.org) on Windows or built-in tar utility on Linux and macOS.
     * On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window in the directory the recovery image is located, and type: 
       ```
       heimdall flash --BOOTLOADER sboot.bin --no-reboot
       ```
     * A blue transfer bar will appear on the device showing the recovery being transferred.

     * Repeat with modem:
       ```
       heimdall flash --MODEM modem.bin
       ```
     * A blue transfer bar will appear on the device showing the recovery being transferred and the device will reboot

6. Unplug the USB cable from your device.
