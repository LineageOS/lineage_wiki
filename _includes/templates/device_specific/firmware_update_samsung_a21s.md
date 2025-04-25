There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://github.com/DaemonMCR/samsung-sm-a217x-fw/releases)
2. Extract the `.tar` file
3. Run the following command:
  ```
heimdall flash --KEYSTORAGE keystorage.bin --LDFW ldfw.img --MISC misc.bin --RADIO modem.bin --CP_DEBUG modem_debug.bin --BOOTLOADER sboot.bin --TZAR tzar.img --TZSW tzsw.img --UP_PARAM up_param.bin
  ```

{% include snippets/fw_update_success.md %}
