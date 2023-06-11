## Unlocking the bootloader

{% include templates/device_specific/before_install_needs_specific_android_fw.md %}

{% include alerts/note.html content="The steps below only need to be run once per device." %}
{% include alerts/warning.html content="Unlocking the bootloader will erase all data on your device!
Before proceeding, ensure the data you would like to retain is backed up to your PC and/or your Google account, or equivalent. Please note that OEM backup solutions like Samsung and Motorola backup may not be accessible from LineageOS once installed." %}
{% include alerts/warning.html content="These instructions are mandatory, and not following them, or not following them correctly may brick your device." %}

1. Follow the instructions [here](https://github.com/npjohnson/sabrina-unlock).
2. Once fastbootd reports "Unlocked", you may proceed.
