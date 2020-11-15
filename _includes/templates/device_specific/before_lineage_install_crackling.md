## Installing the correct firmware

- If you are on the latest CyanogenOS 13.1 firmware (Android 6 Marshmallow) nothing needs to be done. The bootlader version has to be `crackling-13-ge86e772`
  You can check that by entering the fastboot mode and select 'About the Phone' there.
- If you are on the latest Wileyfox firmware (Android 7.1 Nougat) you will have to downgrade the devices firmware before installing LineageOS.

1. Download the latest CyanogenOS Marshmallow firmware from [here](https://cyanogenupdatetracker.com/downloads/wf_swift1/SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY.zip).
2. Sideload the `.zip` package:
    * On the device, enter recovery mode, select "Apply update", "Apply from ADB".
    * On the host machine, sideload the package using: `adb sideload filename.zip`.
