## Pre-Install Notice

Unofficial bootloader unlocks for this device tend to leave the device in a strange state. This can cause a false data-corruption notice when updating LineageOS via the built-in Updater app.

To mitigate this issue, reflash the latest stock firmware for your model before starting.

{% include alerts/warning.html content="An official method of reflashing the stock firmware is not available, but there may be some unofficial methods available. Unofficial methods are not supported by LineageOS, so use them at your own risk! Proceeding with the installation of LineageOS without reflashing stock firmware will render device unable to update via built-in Updater app." %}

## Repartition

{% include alerts/warning.html content="This step is not optional, the device will not boot LineageOS without repartitioning first!" %}
{% include alerts/warning.html content="This process will wipe all data on the device, including your internal storage!" %}

1. Download the flashable repartition script from [here](https://github.com/log1cs/nb1_repartition/releases/download/recovery/nb1_repartition.zip).
2. If you are not in recovery, reboot into recovery:
    * {{ device.recovery_boot }}
3. On your device's screen, choose "Apply Update", then "From ADB".
4. From your Terminal/PowerShell, run `adb sideload /path/to/nb1_repartition.zip`, filling `/path/to/` in with the path you downloaded the repartition script to.
    {% include alerts/note.html content="The repartition script package in question isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
5. The device will complete the repartition process, and once it's completed, you should see something like this:
```
Install completed with status 0.
```
6. After that you might want to go back to the main recovery screen, select "Advanced" and select "Reboot to bootloader", and then format your data partition:
```
fastboot -w
```
Now you can proceed to install LineageOS!
