There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform an OTA update

### You already installed a custom recovery

1. Download the latest firmware for your model:
{% for model in device.models %}
{% unless model contains '/DS' %}
  - [{{ model }}](https://lineage.linux4.de/firmware/{{ model }}.html)
{% endunless %}
{% endfor %}
2. Extract the `.tar` file
3. Run the following command:
  ```
heimdall flash --CM cm.bin --DQMDBG dqmdbg.img --KEYSTORAGE keystorage.bin --RADIO modem.bin --RADIO2 modem_5g.bin --CP_DEBUG modem_debug.bin --CP2_DEBUG modem_debug_5g.bin --PARAM param.bin --BOOTLOADER sboot.bin --UH uh.bin --UP_PARAM up_param.bin
  ```
