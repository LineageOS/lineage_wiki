1. Download the recommended firmware for your model.
   - Redmi K40 - [V13.0.5.0.SKHCNXM](https://bigota.d.miui.com/V13.0.5.0.SKHCNXM/miui_ALIOTH_V13.0.5.0.SKHCNXM_540c833165_12.0.zip)
   - Mi 11X - [V13.0.6.0.SKHINXM](https://bigota.d.miui.com/V13.0.6.0.SKHINXM/miui_ALIOTHINGlobal_V13.0.6.0.SKHINXM_2492066c1d_12.0.zip)
   - POCO F3 - [V13.0.3.0.SKHMIXM](https://bigota.d.miui.com/V13.0.3.0.SKHMIXM/miui_ALIOTHGlobal_V13.0.3.0.SKHMIXM_07afcb74cd_12.0.zip)
2. Extract firmware files from zip using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Run the following commands to flash firmware:
   ```
   fastboot flash abl_ab abl.img
   fastboot flash aop_ab aop.img
   fastboot flash bluetooth_ab bluetooth.img
   fastboot flash cmnlib_ab cmnlib.img
   fastboot flash cmnlib64_ab cmnlib64.img
   fastboot flash devcfg_ab devcfg.img
   fastboot flash dsp_ab dsp.img
   fastboot flash featenabler_ab featenabler.img
   fastboot flash hyp_ab hyp.img
   fastboot flash imagefv_ab imagefv.img
   fastboot flash keymaster_ab keymaster.img
   fastboot flash modem_ab modem.img
   fastboot flash qupfw_ab qupfw.img
   fastboot flash tz_ab tz.img
   fastboot flash uefisecapp_ab uefisecapp.img
   fastboot flash xbl_ab xbl.img
   fastboot flash xbl_config_ab xbl_config.img
   ```
5. Reboot:
   ```
   fastboot reboot
   ```
