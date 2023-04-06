There are two possibilities to get the right firmware version:

NOTE: Only U5 bootloader based firmware is supported! U6 or U4 and older won't boot.

### You are still on the stock OS with locked bootloader

1. Simply perform an OTA update, but check if that update upgrades bootloader version to U6 first, if then you must download U5 firmware and flash it via odin to upgrade. (See below for how to)

### You already installed a custom recovery

1. Download the latest U5 firmware for your model [here](https://samfw.com/firmware/SM-A515F). Samsung OTA servers won't work. As they provide only latest firmwares. (Download the zip and extract all `.tar.md5` files)
   {% include alerts/note.html content="You can find your model number under About Phone in your phone's Settings app!" %}
2. Flash the just downloaded files using Odin. You can have a look at the [recovery installation instructions]({{ "devices/" | append: device.codename | append: "/install#installing-a-custom-recovery-using-odin" | relative_url }}) if you forgot how to do that.
   {% include alerts/note.html content="The filenames will give you a hint on which slot to flash each file to!" %}
