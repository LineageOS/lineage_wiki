{% include templates/device_specific/firmware_update_xiaomi_fastboot.md content="
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
" %}
