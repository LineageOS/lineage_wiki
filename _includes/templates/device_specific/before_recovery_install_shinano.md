## Special Requirements

{% include alerts/note.html content="Flashtool version 0.9.19.9 or later is required." %}
1. Download and install [Flashtool](http://www.flashtool.net/downloads.php) on your machine
 * If you're are a Windows user of any version, open a file explorer and navigate to C:\Flashtool\drivers folder, then install the drivers found within
 * Additionally, if you are a Windows 8.1 (x64) user you will need a patch found [here](http://www.microsoft.com/en-us/download/confirmation.aspx?id=41804)
2. Reboot your machine
3. On the device, navigate to the `Settings` app, in the `System` menu, under the `About this device` listing, and take note of your model number & carrier
4. Open Flashtool
5. Click the symbol to download and open XperiFirm (round button on the right) to download the latest firmware for your device
6. In XPeriFirm, select your device and an appropriate firmware on the middle column with the version `23.5.A.1.291`. Then click on the firmware on the right side below `Available Firmware` and download it
7. After the download finished, close XperiFirm. Flashtool now automatically recognizes the downloaded files and prepares the image to be flashed
8. Now click on the lightning symbol (`flash device`), select `Flashmode` and click on `OK`
9. Select the firmware file you just downloaded above
10. Check **all** the boxes under the "Wipe" menu
11. Click "Flash"
    {% include alerts/tip.html content="It may take a few minutes for the flashing progress indicator to pop up." %}
12. Turn off your phone
13. Hold the volume-down button and keep holding while connecting the device to your PC
14. Once the flashing process has started, release the volume rocker as soon as possible
    {% include alerts/warning.html content="Ensure the USB cable doesn't come unplugged during the flashing process!" %}
15. When the flash finishes, boot up the device and once booted, please proceed with the instructions
