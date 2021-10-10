## Special Considerations
The Shield TV Pro (2015) has some additional quirks you'll want to be aware of.

To discern if you have this model, you can run the following command on stock:
```
adb shell getprop ro.hardware
```

If this command returns anything other than `foster_e_hdd`, proceed with the install process. If it returns `foster_e_hdd` please take note that the `fastboot oem unlock` command the instrutions below will have you run can take up to 90 minutes. This is due to the fact that the device is securely wiping near to 500 GB of hard disk.