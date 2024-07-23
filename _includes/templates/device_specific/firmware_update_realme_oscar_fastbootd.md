{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

There are three possibilities to get the required firmware:

### If you are on the stock OS (Android 14 version higher than 14.0.0.501(EX01)) with locked bootloader

1. Perform an OTA downgrade to Android 13 and update to version 14.0.0.501

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
