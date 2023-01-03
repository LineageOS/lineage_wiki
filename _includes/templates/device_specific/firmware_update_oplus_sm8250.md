{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

{%- if device.before_install.instructions == "needs_specific_android_fw" and device.before_install.version -%}
1. Download the latest **Android {{ device.before_install.version }}** full stock ROM update from [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater)
{%- else -%}
1. Download the latest full stock ROM update from [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater)
{%- endif %}
2. Extract stock ROM using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enable ADB"
5. Check your DDR type using the following command: `adb shell getprop ro.boot.ddr_type`, or in case `getprop` returns an empty value, use: `adb shell cat /proc/devinfo/ddr_type` instead
6. Go to "Advanced" -> "Enter fastboot"
   {% include alerts/warning.html content="The \"Enter fastboot\" option may not be present on older LineageOS recovery builds and it cannot be substituted with \"Reboot to bootloader\"." %}
7. Execute following commands:
   ```
   fastboot flash --slot=all abl abl.img
   fastboot flash --slot=all aop aop.img
   fastboot flash --slot=all bluetooth bluetooth.img
   fastboot flash --slot=all cmnlib64 cmnlib64.img
   fastboot flash --slot=all cmnlib cmnlib.img
   fastboot flash --slot=all devcfg devcfg.img
   fastboot flash --slot=all dsp dsp.img
   fastboot flash --slot=all featenabler featenabler.img
   fastboot flash --slot=all hyp hyp.img
   fastboot flash --slot=all imagefv imagefv.img
   fastboot flash --slot=all keymaster keymaster.img
   fastboot flash --slot=all logo logo.img
   fastboot flash --slot=all mdm_oem_stanvbk mdm_oem_stanvbk.img
   fastboot flash --slot=all modem modem.img
   fastboot flash --slot=all multiimgoem multiimgoem.img
   fastboot flash --slot=all qupfw qupfw.img
   fastboot flash --slot=all spunvm spunvm.img
   fastboot flash --slot=all storsec storsec.img
   fastboot flash --slot=all tz tz.img
   fastboot flash --slot=all uefisecapp uefisecapp.img
   ```
8. Flash correct XBL files
   {% include alerts/warning.html content="Flashing wrong XBL files will brick your phone." %}
   * For DDR type 0 (DDR4):
   ```
   fastboot flash --slot=all xbl_config xbl_config.img
   fastboot flash --slot=all xbl xbl.img
   ```
   * For DDR type 1 (DDR5):
   ```
   fastboot flash --slot=all xbl_config xbl_config_lp5.img
   fastboot flash --slot=all xbl xbl_lp5.img
   ```
