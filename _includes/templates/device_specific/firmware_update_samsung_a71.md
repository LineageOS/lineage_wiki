There are two possibilities to get the latest firmware:

### You are still on the stock OS with locked bootloader

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/Haky86/a71-fw/releases) (All `.tar.md5` files)
   {% include alerts/note.html content="You can find your model number under About Phone in your phone's Settings app!" %}
2. Flash the just downloaded files using [samloader-rs](https://github.com/topjohnwu/samloader-rs):
```
samloader flash --AP AP_*.tar.md5 --BL BL_*.tar.md5 --CP CP_*.tar.md5
```

{% include snippets/fw_update_success.md %}
