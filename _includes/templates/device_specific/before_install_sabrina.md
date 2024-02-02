## Unlocking the bootloader

These instructions will only work on devices that have not yet been updated past the February 2021 OTA.

You can check this in the Settings application under the "System", "About" tab, labeled "Security Patch Level".

If your device was updated past this build, it is not vulnerable to the unlock exploit utilized below, and you cannot run LineageOS on that device.

Downgrading to older builds is not a viable option.

If your device is on the February 2021 OTA, or a build that preceeds it, you can proceed.

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/warning.html content="These instructions are mandatory, and not following them, or not following them correctly may brick your device." %}

1. Unplug the device from your PC.
2. Run `sudo apt install libusb-dev` and enter your sudo password.
3. Run `git clone https://github.com/oddsolutions/sabrina-unlock && cd sabrina-unlock`.
4. Hold the button located on the rear of the device's case, and plug the device into your PC via USB-C.
   The host should see a new USB device connection in dmesg like this one:
```
[10504.840173] usb 1-4.3.1: new high-speed USB device number 16 using xhci_hcd
[10504.979469] usb 1-4.3.1: New USB device found, idVendor=1b8e, idProduct=c003, bcdDevice= 0.20
[10504.979495] usb 1-4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[10504.979514] usb 1-4.3.1: Product: GX-CHIP
[10504.979525] usb 1-4.3.1: Manufacturer: Amlogic
```
5. Release the button once the device has been detected by host computer.
6. Run `sudo ./unlock.sh` and enter your sudo password when asked.
7. Follow the instructions `unlock.sh` presents you with.
8. Once fastbootd reports "Unlocked", you may proceed.
