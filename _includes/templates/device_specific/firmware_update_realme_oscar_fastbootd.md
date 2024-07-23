{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

There are three methods to get the required firmware:

### If you are on the stock OS (Android 14 version higher than 14.0.0.501(EX01)) with locked bootloader

Method 1:

1. Download the OTA downgrade package for your device:
    * Navigate to [Realme's forum](https://c.realme.com).
    * Go to your device's page by clicking **Product** option, followed by the device's name.
    * Click **Rollback Package for Name_of_the_device**.
    * Download and follow **How do I roll back to Android 13** section.
2. Perform an OTA upgrade to Android 14 version 14.0.0.501

Method 2:

1. Unlock bootloader
2. Install LineageOS recovery from download page
3. Follow the last method with LineageOS recovery installed to update to 14.0.0.501 firmware thereafter 

### If you are on the stock OS (Android 12/13 version) with locked bootloader

1. Perform an OTA upgrade to Android 14 version 14.0.0.501

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
