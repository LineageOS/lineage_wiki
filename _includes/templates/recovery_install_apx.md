{%- assign device = site.data.devices[page.device] -%}

## Preparing for installation

Tegra devices come with a unique boot mode called "Tegra ReCovery Mode" or RCM, also known as APX.
Tegraflash is the official Nvidia tool for interfacing with RCM mode on recent Tegra devices.
Tegraflash is only available for Linux. It will also not run properly in a VM.

## Installing a custom recovery using `Tegraflash`

1. Download a [flash package](https://www.androidfilehost.com/?w=files&flid=328892).
{% if device.flash_download_instructions %}
    * {{ device.flash_download_instructions }}
{% else %}
    * It will be named `{{ device.flash_codename }}_flash_package.tar.xz`
{% endif %}
    {% include alerts/note.html content="These flash packages were built by LineageOS Developer Aaron Kling (webgeek1234) from officially supported LineageOS repositories, using Tegraflash and device configurations from Nvidia Linux4Tegra releases and a few custom scripts." %}
2. Extract the package and open a Terminal in the extracted folder.
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
4. On your machine, in the Terminal window, type:
```
sudo ./flash.sh
```
5. The script will flash the boot stack and boot directly to recovery.
