{% assign device = site.data.devices[page.device] %}

## Firmware Requirements

These instructions will only work on devices that have not yet been updated past the April 2024 Security Patch Level to the August 2024 OTA or later.

If your device was updated past this build, it is not able to be bootloader unlocked, and you cannot run LineageOS on that device.

Downgrading to older builds is not a viable option.

You can check this in the Settings application under the "System", "About" tab, labeled "Security Patch Level".

If you have not yet setup your device, **do not** set it up to check the version, or to toggle the OEM Unlock just proceed with the installation instructions, as the setup process forcibly updates the device. Instead proceed past this page and the next and proceed directly to [Forcibly unlocking the bootloader](https://wiki.lineageos.org/devices/{{ device.codename }}/install/#forcibly-unlocking-the-bootloader) and proceed from there.

If your device is already past the setup screen, and on the April 2024 OTA or a build that preceeds it, you can proceed using the "Next Step" button below.
