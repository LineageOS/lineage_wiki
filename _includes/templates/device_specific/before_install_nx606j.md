## Installing a custom bootloader using `edl`

{% include alerts/tip.html content="The steps below only need to be run once per device. Since the stock ABL lacks `fastboot flash` support it is necessary to first install a custom ABL using edl" %}

1. Download the custom [ABL](https://androidfilehost.com/?fid=10620683726822060955).
2. Install the Unofficial Qualcomm Firehose tool. To do so, follow the installation instructions for your operating system [here](https://github.com/bkerler/edl#installation).
3. Connect your device to your PC via USB.
4. On the computer, open a command prompt (on Windows) or terminal (on Linux or macOS) window, and type:
```
adb reboot edl
```
5. Flash abl onto your device:
```
edl w abl abl.elf --memory=ufs --lun=4
```
6. Now reboot the device by holding the <kbd>Power</kbd> button for circa 10 seconds until the splash logo appears.
