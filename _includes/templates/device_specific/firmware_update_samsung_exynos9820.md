There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model:
{%- for model in device.models %}
  - [{{ model }}](https://lineage.linux4.de/firmware/{{ model | replace:'/DS','' }}.html)
{%- endfor %}
2. Extract the `.tar` file
3. Run the following command:
  ```
samloader flash --partition CM cm.bin --partition DQMDBG dqmdbg.img --partition KEYSTORAGE keystorage.bin --partition RADIO modem.bin --partition CP_DEBUG modem_debug.bin --partition PARAM param.bin --partition BOOTLOADER sboot.bin --partition UH uh.bin --partition UP_PARAM up_param.bin
  ```

{% include snippets/fw_update_success.md %}
