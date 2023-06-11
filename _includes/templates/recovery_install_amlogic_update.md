{%- assign device = site.data.devices[page.device] -%}

## Preparing for installation

This generation of Amlogic devices come with a unique boot mode called "Burn Mode".
`aml-flash-tool` is Radxa's wrapper script for Amlogic's official `update` tool for interfacing with burn mode on recent Amlogic devices.
`aml-flash-tool` is only available for Linux. It will run perfectly fine in a VM.

## Flashing the initial image and firmware using `update`

{% include alerts/note.html content="Please note that no matter what Devkit you have, this firmware requires an eMMC module and **will not** work if you only have an SD Card. We will not change this due to performance requirements." %}

1. Download `aml_upgrade.img` file from [here](https://download.ods.ninja/Android/firmware/{{ device.codename }}/)
2. Power off the device, and boot it into burn mode:
    * {{ device.download_boot }}
3. Download and install `aml-flash-tool`
```
git clone https://github.com/radxa/aml-flash-tool.git && cd aml-flash-tool && ./INSTALL
```
    {% include alerts/note.html content="Please note this will require your user's sudo password, as the script requires direct hardware access, which requires root privledges." %}
4. Flash the downloaded image file to your device by running (replace `<aml_upgrade_image.img>` with the actual filename!):
```
sudo ./aml-flash-tool.sh <aml_upgrade_image.img>
```
    {% include alerts/note.html content="These flash packages were built by LineageOS Developer Stricted from officially supported LineageOS repositories, by using `lunch` to select the device, then run `m aml_upgrade`." %}
5. The script will flash the firmware and boot directly into an outdated but functional version of LineageOS. Please proceed with the installation instructions to complete the installation process.
