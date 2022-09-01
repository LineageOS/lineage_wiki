## Special Considerations
The Shield TV Pro (2015) has some additional quirks you'll want to be aware of.

To discern if you have this model, you can run the following command on stock:
```
adb shell getprop ro.hardware
```

If this command returns anything other than `foster_e_hdd` or `jetson_cv`, proceed with the install process. If it returns `foster_e_hdd` please take note that the `fastboot oem unlock` command the instrutions below will have you run can take up to 90 minutes. This is due to the fact that the device is securely wiping near to 500 GB of hard disk.

If it returns `jetson_cv`, or if you have a fresh Jetson TX1, the installation instructions require a Linux host to install, and getting Linux up and running won't be covered here.
1. Download a [flash package](https://www.androidfilehost.com/?w=files&flid=328892).
    * It will be named `p2371_flash_package.tar.xz`
    {% include alerts/note.html content="These flash packages were built by LineageOS Developer Aaron Kling (webgeek1234) from officially supported LineageOS repositories, using Tegraflash and device configurations from NVIDIA Linux4Tegra releases and a few custom scripts." %}
2. Install `xz` and `python3`. To do so, run `sudo apt -y install xz-utils python3` (Debian based hosts) or `dnf -y install xz-utils python3` (Redhat based hosts).
3. Run the following command in the folder which you downloaded the flash package to `tar -xvf p2371_flash_package.tar.xz`.
3. Power off the device, and boot it into download mode:
    * With the device off, press the <kbd>FRC REC</kbd> button, then tap power. Release the <kbd>FRC REC</kbd> button once the device enumerates in APX mode, to discern this, run `sudo dmesg` on your host, and look for "Product: APX", if it doesn't show, please try this step again or try a different USB cable/port until it enumerates.
4. Now, from the same terminal as before, run:
```
sudo ./flash.sh
```
    {% include alerts/note.html content="Please note this will require your user's sudo password, as the script requires direct hardware access, which requires root privledges." %}
5. The script will flash the boot stack and boot directly to LineageOS Recovery. Now, please skip to the section labeled "[Installing LineageOS from recovery](https://wiki.lineageos.org/devices/foster/install#installing-lineageos-from-recovery)":
