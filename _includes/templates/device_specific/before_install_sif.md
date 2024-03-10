## USB Port Installation

Out of the box, this device has no USB port, but has an unpopulated header on the PCB that exposes USB pins.

By purchasing a verical Micro-USB (Type-B) female header like [this one](https://www.digikey.com/en/products/detail/würth-elektronik/614105150621/5047748), or any part matching or similar enough to a `Würth Elektronik (VA) / 614105150621`.
and either soldering or using hot-air to seat the USB port on the pins, you can still unlock the bootloader and install LineageOS on this device.

{% include alerts/warning.html content="If you lack soldering/hot-air station skills, this project is not a good project for learners, and you are very likely to damage the device irreparably. It is highly reccomended to practice soldering/hot-air station skills extensively before attempting." %}

To install the header, first remove all cables attached to the device, and the Micro SD card. Then use a Torx T4 screwdriver to remove the two screws shown here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step1.jpg#center){: width="50%" }

You can pop the cover of this end off as shown here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step2.jpg#center){: width="50%" }

Then, from the opposite end of the device (the one with the HDMI port), push through the tube to slide the carrier all the way out of the case as shown here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step3.jpg#center){: width="50%" }

At this point, take note of the orientation it went in the tube, it must pre put back that way after header installation.

At this point, you will need to either solder, or use hot-air to affix a USB header like the one mentioned above, or some jumper wires to the pins highlighted here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step4.jpg#center){: width="50%" }

Please note that this image is of a completed installation of the port.

For further reference and port positioning/orientation, see here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step5.jpg#center){: width="50%" }.

Optionally if you'd like persistent access to the USB port, you can route out the plastic casing of the device as shown here:

![](https://github.com/LineageOS/lineage_wiki/raw/main/images/device_specific/sif/step6.jpg#center){: width="50%" }

Once the USB port is installed, connect to the Micro-USB (Type-B) port, then connect power while holding the pairing button on the device directly above the HDMI port. You should see the device enumerate over USB while showing the fastboot menu on-screen.

Run `fastboot devices` on your host machine to verify connectivity.

If you don't see your device at this point, try reseating the port or verifying that all pins are making contact.

If you see the device serial number followed by "device", you have successfully installed the header and may proceed with the installation instructions.

{% include alerts/note.html content="If you would like to look at the full album of installation photos, you can view them [here](https://github.com/LineageOS/lineage_wiki/tree/main/images/device_specific/sif/)." %}
