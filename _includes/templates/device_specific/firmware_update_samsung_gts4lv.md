There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/luk1337/gts4lv-fw/releases) (All `.tar.md5` files)
   {% include alerts/note.html content="You can find your model number on the back of your device!" %}
2. Flash the just downloaded files using Odin. You can have a look at the [recovery installation instructions]({{ device | device_link: "/install" | append: "#installing-lineage-recovery-using-odin" | relative_url }}) if you forgot how to do that.
   {% include alerts/note.html content="The filename will give you a hint on which slot to flash each file to!" %}

{% include snippets/fw_update_success.md %}
