{%- assign device = site.data.devices[page.device] -%}

## Preparing for installation

Tegra devices come with a unique boot mode called "Tegra ReCovery Mode" or RCM, also known as APX.
Tegraflash is the official NVIDIA tool for interfacing with RCM mode on recent Tegra devices.
Tegraflash is only available for Linux. It will also not run properly in a VM.

## Installing a custom recovery using `Tegraflash`

1. Download a [flash package](https://download.lineageos.org/devices/{{ device.codename }}) for your device.
{% if device.flash_download_instructions %}
    * {{ device.flash_download_instructions }}
{% else %}
    * It will be named `{{ device.flash_codename }}_flash_package.tar.xz`
{% endif %}
    {% include alerts/note.html content="If you are in need of flash packages for LineageOS 20.0 or older, you can find them [here](https://www.androidfilehost.com/?w=files&flid=328892)." %}

2. Install `xz` and `python3`. To do so, run `sudo apt -y install xz-utils python3` (Debian based hosts) or `sudo dnf -y install xz-utils python3` (Redhat based hosts).
3. Run the following command in the folder which you downloaded the flash package to:
{% if device.flash_extract_instructions %}
    * {{ device.flash_extract_instructions }}
{% else %}
    * `tar -xvf {{ device.flash_codename }}_flash_package.tar.xz`
{% endif %}
    {% include alerts/note.html content="To discern if the device is in APX mode, run `sudo dmesg` on your host, and look for "Product: APX", if it doesn't show, please try this step again or try a different USB cable/port until it enumerates." %}

3. Power off the device, and boot it into download mode:
    * {{ device.download_boot }}
4. Now, from the same terminal as before, run:
```
sudo ./flash.sh
```
    {% include alerts/note.html content="Please note this will require your user's sudo password, as the script requires direct hardware access, which requires root privledges." %}
5. The script will flash the boot stack and boot directly to LineageOS Recovery. Now, please skip to the section labeled "[Installing LineageOS from recovery](https://wiki.lineageos.org/devices/{{ device.codename }}/install#installing-lineageos-from-recovery)":
