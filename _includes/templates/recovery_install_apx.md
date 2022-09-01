{%- assign device = site.data.devices[page.device] -%}

## Preparing for installation

Tegra devices come with a unique boot mode called "Tegra ReCovery Mode" or RCM, also known as APX.
Tegraflash is the official NVIDIA tool for interfacing with RCM mode on recent Tegra devices.
Tegraflash is only available for Linux. It will also not run properly in a VM.

## Installing a custom recovery using `Tegraflash`

1. Download a [flash package](https://www.androidfilehost.com/?w=files&flid=328892).
{% if device.flash_download_instructions %}
    * {{ device.flash_download_instructions }}
{% else %}
    * It will be named `{{ device.flash_codename }}_flash_package.tar.xz`
{% endif %}
    {% include alerts/note.html content="These flash packages were built by LineageOS Developer Aaron Kling (webgeek1234) from officially supported LineageOS repositories, using Tegraflash and device configurations from NVIDIA Linux4Tegra releases and a few custom scripts." %}
2. Install `xz` and `python3`. To do so, run `sudo apt -y install xz-utils python3` (Debian based hosts) or `dnf -y install xz-utils python3` (Redhat based hosts).
3. Run the following command in the folder which you downloaded the flash package to:
{% if device.flash_extract_instructions %}
    * {{ device.flash_extract_instructions }}
{% else %}
    * `tar -xvf {{ device.flash_codename }}_flash_package.tar.xz`
{% endif %}
3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
4. Now, from the same terminal as before, run:
```
sudo ./flash.sh
```
    {% include alerts/note.html content="Please note this will require your user's sudo password, as the script requires direct hardware access, which requires root privledges." %}
5. The script will flash the boot stack and boot directly to recovery.
