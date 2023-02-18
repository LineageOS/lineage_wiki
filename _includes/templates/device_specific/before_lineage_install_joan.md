## Restoring original firmware, excluding recovery

{% include alerts/note.html content="The steps below only need to be run once per device." %}

{% include alerts/warning.html content="Without following this step, your device will not function as expected." %}

1. Go to [this website](https://sourceforge.net/projects/jacoas-v30-files/files/Stock%20Roms/)
1. Navigate to the corresponding folder for your model number
    * i.e. if your device is the `H930DS` model, open the `H930DS` folder
1. Download the `<model>_Bootloader.zip` file corresponding to your device
1. Sideload the newly downloaded `_Bootloader_.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload <model>_Bootloader.zip`
1. Now reboot to recovery by tapping "Advanced", then "Reboot to recovery".
