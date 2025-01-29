There are two possibilities to get the latest firmware:

### You are still on the stock OS

1. Simply perform OTA updates until the device reports that no updates are available.

### You already installed a custom recovery

1. Download the latest firmware for your model:
{%- for model in device.models %}
  - [{{ model }}](https://github.com/cat658011/samsung-universal9611-fw/releases/download/last/{{ model | replace:'/DS','' }}.tar)
{%- endfor %}
   {% include alerts/note.html content="You can find your model number on the back of your device!" %}
2. Extract the `.tar` file
3. Run the following command:
  ```
heimdall flash --CM cm.bin --KEYSTORAGE keystorage.bin --RADIO modem.bin --CP_DEBUG modem_debug.bin --PARAM param.bin --BOOTLOADER sboot.bin --UH uh.bin --UP_PARAM up_param.bin
  ```

{% include snippets/fw_update_success.md %}
