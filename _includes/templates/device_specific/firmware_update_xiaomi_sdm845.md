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
   fastboot flash abl_ab abl.elf
   fastboot flash aop_ab aop.img
   fastboot flash bluetooth bluetooth.img
   fastboot flash cmnlib_ab cmnlib.img
   fastboot flash cmnlib64_ab cmnlib64.img
   fastboot flash devcfg_ab devcfg.img
   fastboot flash dsp dsp.img
   fastboot flash hyp_ab hyp.img
   fastboot flash keymaster_ab keymaster.img
   fastboot flash logo logo.img
   fastboot flash modem modem.img
   fastboot flash qupfw_ab qupfw.img
   fastboot flash storsec_ab storsec.img
   fastboot flash tz_ab tz.img
   fastboot flash xbl_ab xbl.img
   fastboot flash xbl_config_ab xbl_config.img
   ```
6. Reboot:
   ```
   fastboot reboot
   ```

