{%- assign device = site.data.devices[page.device] -%}

## Preparing for installation

This generation of Amlogic devices include a unique boot mode called "Burn Mode".
`aml-flash-tool` is Radxa's wrapper script for Amlogic's official `update` tool, which allows interfacing with burn mode. It's only available for Linux, though a VM will suffice.

## Flashing the initial image and firmware using `update`

{% include alerts/note.html content="Please note regardless of the board you have, this firmware requires an eMMC module and **will not** work with only an SD Card. We will not change this due to performance requirements." %}

1. Download `aml_install_package.img` file from [here](https://download.lineageos.org/devices/{{ device.codename }}).
2. Power off the device, and boot it into burn mode:
    * {{ device.download_boot }}
3. Download and install `aml-flash-tool`:
```
git clone https://github.com/radxa/aml-flash-tool.git
cd aml-flash-tool
sudo ./INSTALL.sh
```
    {% include alerts/note.html content="Please note this will require your user's sudo password, as the script requires direct hardware access, which requires root privileges." %}
4. Flash the downloaded image file to your device by running (replace `<aml_install_package.img>` with the actual filename!):
```
sudo ./aml-flash-tool.sh <aml_install_package.img>
```
    {% include alerts/note.html content="These flash packages were built by LineageOS maintainers from officially supported LineageOS repositories, by using `lunch` to select the device, then run `m aml_install`." %}
    {% include alerts/warning.html content="Please note that both `aml-flash-tool` and `update` are known to be somewhat finicky on specific host platforms (e.g. AMD machines). If you see any failures in flashing, return to step 2 and try again." %}
5. The script will flash the firmware, and after you see `Resetting board [OK]`, plug in a USB keyboard and cycle power to the board, at which point you will see LineageOS Recovery boot. You may now proceed with the following installation instructions.
6. Using your keyboard's <kbd>arrow keys</kbd> to navigate, and <kbd>enter key</kbd> to select the "Advanced" option, then "Enter fastboot".
7. Download `super_empty.img` from [here](https://download.lineageos.org/devices/{{ device.codename }}).
8. Now, prepare the super image for dynamic partitions by running the following (replace `<super_empty.img>` with the actual filename!):
```
fastboot -w wipe-super <super_empty.img>
```
9. Now, using your keyboard, select "Enter recovery".
