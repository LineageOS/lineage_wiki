{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

There are three methods to get the required firmware:

### If you are on the stock Realme UI (Android 14 version higher than 14.0.0.501(EX01)) with locked bootloader

Method 1:

1. Download the OTA downgrade package for your device:
    * Navigate to [Realme's forum](https://c.realme.com).
    * Go to your device's page by clicking **Product** option, followed by the device's name.
    * Click **Rollback Package for Name_of_the_device**.
    * Download and follow **How do I roll back to Android 13** section.
2. Perform an OTA upgrade through system updater to Android 14 version 14.0.0.501
    * Navigate to Settings > About device.
    * Tap on the Realme UI banner.
    * Tap install button.
    * Continue the steps untill you install the version 14.0.0.501.

Method 2:

   {% include alerts/warning.html content="Follow this method only if the OTA downgrade package mentioned in Method 1 is not present for your variant" %}
1. Unlock bootloader
2. Download the following files from [here](https://download.lineageos.org/devices/{{ device.codename }}).
    * boot.img
    * dtbo.img
    * vendor_boot.img
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Flash the downloaded image files to your device by typing:
   ```
   fastboot flash boot boot.img
   fastboot flash dtbo dtbo.img
   fastboot flash vendor_boot vendor_boot.img
   ```
5. Follow the last method in this page with LineageOS recovery installed section to update to 14.0.0.501 firmware thereafter

### If you are on the stock Realme UI (Android 12/13 version) with locked bootloader

1. Perform an OTA upgrade through system updater to Android 14 version 14.0.0.501
    * Navigate to Settings > About device.
    * Click on the Realme UI banner.
    * Tap install button.
    * Continue the steps untill you install the version 14.0.0.501.

### If you already installed LineageOS recovery

1. Download the required firmware from [here](https://github.com/Realme-SM6375-devs/firmware/releases)
2. Extract the firmware zip
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
   {% include alerts/warning.html content="The \"Enter fastboot\" option may not be present on older LineageOS recovery builds and it cannot be substituted with \"Reboot to bootloader\"." %}
5. Execute following commands:
   ```
   {{- include.content -}}
   ```
