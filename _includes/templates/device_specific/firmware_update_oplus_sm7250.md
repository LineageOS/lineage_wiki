{%- if device.before_install.instructions == "needs_specific_android_fw" and device.before_install.version -%}
1. Download the latest **Android {{ device.before_install.version }}** full stock ROM update from [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater)
{%- else -%}
1. Download the latest full stock ROM update from [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater)
{%- endif %}
2. Extract stock ROM using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enable ADB"
5. Go to "Advanced" -> "Enter fastboot"
   {% include alerts/warning.html content="The \"Enter fastboot\" option may not be present on older LineageOS recovery builds and it cannot be substituted with \"Reboot to bootloader\"." %}
6. Execute following commands:
   ```
   fastboot flash --slot=all abl abl.img
   fastboot flash --slot=all aop aop.img
   fastboot flash --slot=all bluetooth bluetooth.img
   fastboot flash --slot=all devcfg devcfg.img
   fastboot flash --slot=all dsp dsp.img
   fastboot flash --slot=all featenabler featenabler.img
   fastboot flash --slot=all hyp hyp.img
   fastboot flash --slot=all imagefv imagefv.img
   fastboot flash --slot=all keymaster keymaster.img
   fastboot flash --slot=all logo logo.img
   fastboot flash --slot=all modem modem.img
   fastboot flash --slot=all qupfw qupfw.img
   fastboot flash --slot=all storsec storsec.img
   fastboot flash --slot=all tz tz.img
   fastboot flash --slot=all uefisecapp uefisecapp.img
   fastboot flash --slot=all xbl_config xbl_config.img
   fastboot flash --slot=all xbl xbl.img
   ```
