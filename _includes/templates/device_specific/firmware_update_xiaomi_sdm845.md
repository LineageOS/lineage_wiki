{% include alerts/warning.html content="Make sure to download exact firmware for your model. You can discern your model from Settings > About phone > MIUI version (Eg: In MIUI version V13.0.6.0 SKHMIXM 'MI' represents your phone region, which is Global). You can also verify your Xiaomi phone at [official site](https://www.mi.com/global/verify)." %}

{%- if device.before_install_device_variants and device.before_install_device_variants.size > 0 %}
1. Download the required firmware for your model.
{%- for el in device.before_install_device_variants %}
   - {{ el.device }} - [{{ el.firmware }}]({{ el.download_link }})
{%- endfor %}
{%- else %}
1. Download the latest firmware for your device from official website.
{%- endif %}
2. Extract firmware files from zip
   ```
   unzip -qq miui_*.zip firmware-update/*
   cd firmware-update
   ```
3. Reboot into recovery
    * {{ device.recovery_boot }}
4. Go to `Advanced` > `Enter fastboot`
   {% include alerts/warning.html content="The \"Enter fastboot\" option may not be present on older LineageOS recovery builds and it cannot be substituted with \"Reboot to bootloader\"." %}
5. Run the following commands to flash firmware :
   ```
   fastboot flash abl_a abl.elf
   fastboot flash abl_b abl.elf
   fastboot flash aop_a aop.img
   fastboot flash bluetooth bluetooth.img
   fastboot flash cmnlib_a cmnlib.img
   fastboot flash cmnlib64_a cmnlib64.img
   fastboot flash devcfg_a devcfg.img
   fastboot flash dsp dsp.img
   fastboot flash hyp_a hyp.img
   fastboot flash keymaster_a keymaster.img
   fastboot flash logo logo.img
   fastboot flash modem modem.img
   fastboot flash qupfw_a qupfw.img
   fastboot flash storsec_a storsec.img
   fastboot flash tz_a tz.img
   fastboot flash xbl_a xbl.img
   fastboot flash xbl_config_a xbl_config.img
   ```
6. Reboot:
   ```
   fastboot reboot
   ```

