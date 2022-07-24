1. Download the latest firmware for your model [here](https://github.com/Linux4/firmware-update/releases/download/P615XXU4EVE5/firmware-SM-P615-P615XXU4EVE5.tar)
2. Extract the `.tar` file
3. Run the following command:
  ```
heimdall flash --CM cm.bin --KEYSTORAGE keystorage.bin --RADIO modem.bin --CP_DEBUG modem_debug.bin --BOOTLOADER sboot.bin --UH uh.bin --UP_PARAM up_param.bin
  ```
