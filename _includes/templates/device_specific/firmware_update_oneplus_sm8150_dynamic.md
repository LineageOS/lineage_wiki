{% include alerts/warning.html content="These instructions only apply to retail devices. If you happen to have a branded device you will have to download firmware files from elsewhere." %}

1. Download latest stock ROM from [oneplus.com](https://oneplus.com/support/softwareupgrade) or [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater).
   Oxygen Updater app usually happens to have newer releases available as OnePlus website tends to lag a bit.
2. Extract payload.bin using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
5. Execute following commands:
```
fastboot flash abl_a abl.img
fastboot flash abl_b abl.img
fastboot flash aop_a aop.img
fastboot flash aop_b aop.img
fastboot flash bluetooth_a bluetooth.img
fastboot flash bluetooth_b bluetooth.img
fastboot flash cmnlib64_a cmnlib64.img
fastboot flash cmnlib64_b cmnlib64.img
fastboot flash cmnlib_a cmnlib.img
fastboot flash cmnlib_b cmnlib.img
fastboot flash devcfg_a devcfg.img
fastboot flash devcfg_b devcfg.img
fastboot flash dsp_a dsp.img
fastboot flash dsp_b dsp.img
fastboot flash hyp_a hyp.img
fastboot flash hyp_b hyp.img
fastboot flash imagefv_a imagefv.img
fastboot flash imagefv_b imagefv.img
fastboot flash keymaster_a keymaster.img
fastboot flash keymaster_b keymaster.img
fastboot flash LOGO_a LOGO.img
fastboot flash LOGO_b LOGO.img
fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot flash multiimgoem_a multiimgoem.img
fastboot flash multiimgoem_b multiimgoem.img
fastboot flash oem_stanvbk oem_stanvbk.img
fastboot flash opproduct_a opproduct.img
fastboot flash opproduct_b opproduct.img
fastboot flash qupfw_a qupfw.img
fastboot flash qupfw_b qupfw.img
fastboot flash storsec_a storsec.img
fastboot flash storsec_b storsec.img
fastboot flash tz_a tz.img
fastboot flash tz_b tz.img
fastboot flash uefisecapp_a uefisecapp.img
fastboot flash uefisecapp_b uefisecapp.img
fastboot flash xbl_config_a xbl_config.img
fastboot flash xbl_config_b xbl_config.img
fastboot flash xbl_a xbl.img
fastboot flash xbl_b xbl.img
```
