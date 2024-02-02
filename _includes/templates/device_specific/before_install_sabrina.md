## Unlocking the bootloader

{% include templates/device_specific/before_install_needs_specific_android_fw.md %}

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/warning.html content="These instructions are mandatory, and not following them, or not following them correctly may brick your device." %}

1. Unplug the device from your PC
2. Run `sudo apt install libusb-dev` and enter your sudo password
3. Run `git clone https://github.com/oddsolutions/sabrina-unlock && cd sabrina-unlock`
4. Hold the button located on the rear of the device's case, and plug the CCwGTV into your PC via USB-C
   The host should see a new USB device connection in dmesg like this one:
```
[10504.840173] usb 1-4.3.1: new high-speed USB device number 16 using xhci_hcd
[10504.979469] usb 1-4.3.1: New USB device found, idVendor=1b8e, idProduct=c003, bcdDevice= 0.20
[10504.979495] usb 1-4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[10504.979514] usb 1-4.3.1: Product: GX-CHIP
[10504.979525] usb 1-4.3.1: Manufacturer: Amlogic
```
5. Release the button once the device has been detected by host computer
6. Run `sudo ./unlock.sh` and enter your sudo password when asked
7. Follow the instructions `unlock.sh` presents you with
8. Once fastbootd reports "Unlocked", you may proceed.
