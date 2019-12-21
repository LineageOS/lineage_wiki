## Updating firmware

- If you are installing from LP (5.x) stock MIUI, nothing needs to be done.
- If you are installing from KK (4.4) stock MIUI, you will have to update the device's **firmware**.

1. To find your model number, "Open "Settings", navigate to "Phone Info", and take note of the model number below the "model" header:
      - Devices with model numbers `2014811, 2014812, 2014817 2014818, 2014819, and 2014821`
       should download the firmware labeled `wt88047`.
      - Devices with model numbers `2014813, and 2014112` should download the firmware labeled
       `wt86047`.
2. Download the relevant firmware zip file from [here](https://www.androidfilehost.com/?w=files&flid=303434).
3. Sideload the firmware `.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload.
    * On the host machine, sideload the package using: `adb sideload filename.zip`.
