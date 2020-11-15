## Installing the correct firmware

- If your bootloader property matches the one stated above, you can skip the following two steps, if it doesn't you will need install the latest CyanogenOS 13.1 firmware (Android 6.0.1 Marshmallow) before proceeding. To do this, follow the instructions below:

1. Download the latest CyanogenOS 13.1 firmware from [here](https://androidfilehost.com/?fid=2188818919693770337).
2. Now tap **Factory Reset**, then **Format data / factory reset** and continue with the formatting process. This will remove encryption and delete all files stored in the internal storage, as well as format your cache partition.
3. Sideload the `SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY_v2.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload SW27-WF-CRACKLING-CM-13.1.5-ZNH2KAS7EB-RECOVERY_v2.zip`
    {% include alerts/note.html content="The firmware package in question is signed by the OEM, but isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
