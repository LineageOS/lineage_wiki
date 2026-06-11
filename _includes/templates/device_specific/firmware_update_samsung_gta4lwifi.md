There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/chrmhoffmann/gta4l-fw/releases) (All `.tar.md5` files)
   {% include alerts/note.html content="You can find your model number on the back of your device!" %}
2. Flash the just downloaded files using [samloader-rs](https://github.com/topjohnwu/samloader-rs):
```
samloader flash --AP AP_*.tar.md5
```

{% include snippets/fw_update_success.md %}
