There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/DaemonMCR/samsung-sm-a217x-fw/releases)
2. Extract the `.tar` file
3. Run the following command:
  ```
samloader flash --partition KEYSTORAGE keystorage.bin --partition LDFW ldfw.img --partition MISC misc.bin --partition RADIO modem.bin --partition CP_DEBUG modem_debug.bin --partition BOOTLOADER sboot.bin --partition TZAR tzar.img --partition TZSW tzsw.img --partition UP_PARAM up_param.bin
  ```

{% include snippets/fw_update_success.md %}
