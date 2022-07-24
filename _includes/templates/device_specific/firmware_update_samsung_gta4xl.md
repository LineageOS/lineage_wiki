There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model [here](https://lineage.linux4.de/firmware/SM-P615.html)
2. Extract the `.tar` file
3. Run the following command:
  ```
heimdall flash --CM cm.bin --KEYSTORAGE keystorage.bin --RADIO modem.bin --CP_DEBUG modem_debug.bin --BOOTLOADER sboot.bin --UH uh.bin --UP_PARAM up_param.bin
  ```
