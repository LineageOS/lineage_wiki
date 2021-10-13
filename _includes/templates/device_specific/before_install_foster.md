## Special Considerations
The Shield TV Pro (2015) has some additional quirks you'll want to be aware of.

To discern if you have this model, you can run the following command on stock:
```
adb shell getprop ro.hardware
```

If this command returns anything other than `foster_e_hdd`, proceed with the install process. If it returns `foster_e_hdd` please take note that the `fastboot oem unlock` command the instrutions below will have you run can take up to 90 minutes. This is due to the fact that the device is securely wiping near to 500 GB of hard disk.

If you have a Jetson TX1, use the following instructions to install recovery, then skip to the install LineageOS step.
1. Download a [flash package](https://www.androidfilehost.com/?w=files&flid=328892).
    * It will be named `p2371_flash_package.tar.xz`
2. Extract the package and open a Terminal in the extracted folder.
3. Power off the device, and boot it into download mode:
    * With the device off, press the frc rec button, then tap power. Release frc rec once apx enumerates.
4. On your machine, in the Terminal window, type:
```
sudo ./flash.sh
```
5. The script will flash the boot stack and boot directly to recovery.
