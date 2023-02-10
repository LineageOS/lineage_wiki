There are two possibilities to get the latest firmware:

### You are still on the stock OS with locked bootloader

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/Simon1511/a52q-a72q-fw/releases) (All `.tar.md5` files)
   {% include alerts/note.html content="You can find your model number under About Phone in your phone's Settings app!" %}
2. Flash the just downloaded files using Odin. You can have a look at the [recovery installation instructions]({{ "devices/" | append: device.codename | append: "/install#installing-a-custom-recovery-using-odin" | relative_url }}) if you forgot how to do that.
   {% include alerts/note.html content="The filenames will give you a hint on which slot to flash each file to!" %}
