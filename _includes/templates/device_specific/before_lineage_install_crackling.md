## Installing the correct firmware

- If your bootloader property matches the one stated above, you can skip the following two steps, if it doesn't you will need install the latest CyanogenOS 13.1 firmware (Android 6.0.1 Marshmallow) before proceeding. To do this, follow the instructions below:

1. Download the latest CyanogenOS 13.1 firmware from [here](https://cyanogenupdatetracker.com/downloads/wf_swift1/SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY.zip).
2. Sideload the `SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY.zip`
    {% include alerts/note.html content="The firmware package in question is signed by the OEM, but isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}