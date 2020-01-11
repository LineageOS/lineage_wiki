## Special Requirements

{% include alerts/warning.html content="Before following these instructions please ensure that the device is on firmware version 23.5.A.1.291. To discern this, you can run the command `adb shell getprop ro.build.display.id` on stock after following the steps under the `Basic Requirements` header below. If the device is on the specified version, please move on to the `Basic Requirements` header below. If the device is not on the specified version, please follow the instructions below to install it." %}

1. Download and install [Flashtool](http://www.flashtool.net/downloads.php) on your machine
 * If you are a Windows 8.1 (x64) user you will also need a patch found [here](http://www.microsoft.com/en-us/download/confirmation.aspx?id=41804)
2. Navigate into C:\Flashtool\drivers folder and install the drivers found within
3. Now reboot your machine.
4. On the device, navigate to the `Settings` app, in the `System` menu, under the `About this device` listing, and take note of your model number & carrier.
5. Download the firmware you need for your model/carrier found below, t: 
 * [Baltic Generic (1288-5413)](http://forum.xda-developers.com/showpost.php?p=68187188&postcount=2176)
 * [CE1 Central Europe (1288-7915)](http://forum.xda-developers.com/showpost.php?p=68296093&postcount=2187)
 * [Germany (1289-4696)](http://forum.xda-developers.com/showpost.php?p=68132744&postcount=2175)
 * [Italy (1289-4008)](http://forum.xda-developers.com/showpost.php?p=68078237&postcount=2172)
 * [MENA Arabic (1288-3756)](http://forum.xda-developers.com/showpost.php?p=69039675&postcount=2221)
 * [Spain (1288-5410)](http://forum.xda-developers.com/showpost.php?p=68767423&postcount=2219)
 * [Russia (1289-0445)](https://forum.xda-developers.com/showpost.php?p=68131906&postcount=2174")
6. Open Flashtool
 * If you're on Windows, and Flashtool presents you with this message "Please move `C:\Flashtool\firmwares` content to `C:\Users\yourusername\.flashTool\firmwares`", close Flashtool, navigate into `C:\Flashtool` directory, cut (not just copy) the "firmwares" folder and paste it inside C:\Users\yourusername\.flashTool directory.
7. Now click on the lightning symbol ("flash device"), select "Flashmode" and click on "OK"
6. Select the firmware file you just downloaded above
7. Check **all** the boxes under the "Wipe" menu
8. Click "Flash"
{% include alerts/warning.html content="It may take a few minutes, for the flashing progress indicator to pop up." %}
9. Turn off your phone
10. Hold the volume-down button, and keep holding while connecting the device to your PC
11. Once the flashing process has started, release the volume rocker as soon as possible
{% include alerts/warning.html content="Ensure the USB cable doesn't come unplugged during the flashing process!" %}
12. When the flash finishes, boot up the device, and once booted, please proceed with the instructions