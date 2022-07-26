1. Download the required firmware for your model.
{% include alerts/warning.html content="Make sure to download exact firmware for your model. Know your model from Settings > About Phone > MIUI Version. Eg: V13.0.6.0 (SKHEUXM) 'EU' represents your phone's region." %}
   - Mi 11X India - [V13.0.6.0.SKHINXM](https://bigota.d.miui.com/V13.0.6.0.SKHINXM/miui_ALIOTHINGlobal_V13.0.6.0.SKHINXM_2492066c1d_12.0.zip)
   - POCO F3 EEA - [V13.0.6.0.SKHEUXM](https://bigota.d.miui.com/V13.0.6.0.SKHEUXM/miui_ALIOTHEEAGlobal_V13.0.6.0.SKHEUXM_c393876947_12.0.zip)
   - POCO F3 Global - [V13.0.3.0.SKHMIXM](https://bigota.d.miui.com/V13.0.3.0.SKHMIXM/miui_ALIOTHGlobal_V13.0.3.0.SKHMIXM_07afcb74cd_12.0.zip)
   - POCO F3 Indonesia - [V13.0.2.0.SKHIDXM](https://bigota.d.miui.com/V13.0.2.0.SKHIDXM/miui_ALIOTHIDGlobal_V13.0.2.0.SKHIDXM_80a5a01aa6_12.0.zip)
   - POCO F3 Russia - [V13.0.2.0.SKHRUXM](https://bigota.d.miui.com/V13.0.2.0.SKHRUXM/miui_ALIOTHRUGlobal_V13.0.2.0.SKHRUXM_101e499a8e_12.0.zip)
   - POCO F3 Taiwan - [V13.0.1.0.SKHTWXM](https://bigota.d.miui.com/V13.0.1.0.SKHTWXM/miui_ALIOTHTWGlobal_V13.0.1.0.SKHTWXM_1573a396df_12.0.zip)
   - POCO F3 Turkey - [V13.0.1.0.SKHTRXM](https://bigota.d.miui.com/V13.0.1.0.SKHTRXM/miui_ALIOTHTRGlobal_V13.0.1.0.SKHTRXM_1eaf50fc2f_12.0.zip)
   - Redmi K40 China - [V13.0.5.0.SKHCNXM](https://bigota.d.miui.com/V13.0.5.0.SKHCNXM/miui_ALIOTH_V13.0.5.0.SKHCNXM_540c833165_12.0.zip)
2. Extract firmware files from zip using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
   - Windows
   ```
   payload-dumper-go.exe miui_ALIOTHGlobal_V13.0.3.0.SKHMIXM_07afcb74cd_12.0.zip
   ```
   - Linux
   ```
   ./payload-dumper-go miui_ALIOTHGlobal_V13.0.3.0.SKHMIXM_07afcb74cd_12.0.zip
   ```
3. Power off the device, and boot it into bootloader mode:
    * {{ device.download_boot }}
4. Run the following commands to flash firmware in the extracted folder:
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
