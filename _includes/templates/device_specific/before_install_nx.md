## Pre-Install Information

LineageOS builds for this device support the following device configurations:

Configuration 1:
* An original, exploitable "v1" Nintendo Switch with your preffered JoyCons attached during installation
    {% include alerts/note.html content="This can be identified by the model number "MOD." on the rear of the device `HAC-001` is exploitable, while `HAC-001(-01), or any other model number is not, and therefore you must use Configuration 2." %}
* An RCM Jig such as [this one](https://www.amazon.com/Nintendo-Switch-Short-Connector-Recovery/dp/B07J9JJRRG))
* Hekate `v6.1.0` loaded via a Fusee launcher such as [this one](https://webrcm.github.io)
    {% include alerts/warning.html content="This configuration requires that the Fusee launcher be ran every time you wish to boot Android! With this in mind, Configuration 2 is heavily preferred." %}

Configuration 2:
* A hard-modded (often called "ModChipped") Switch v1 / v2 / Lite / OLED with your preffered JoyCons attached during installation
* Hekate `v6.1.0` on your SD Card, and loaded by your ModChip

Additionally, we support two installation locations:
* SD Card
    {% include alerts/warning.html content="This installation location requires a high quality, high speed SD Card to function." %}
* eMMC
    {% include alerts/warning.html content="This installation location requires space be taken from HOS (the stock Switch OS), so please tread carefully." %}

All installation paths supported require the `Dynamic: Android 13+` partition scheme offered in Hekate.
    {% include alerts/warning.html content="Upgrades, or dirty-installs from any unofficial build will NOT function, please start with a freshly partitioned system." %}

This guide will not detail exploiting or ModChipping your Switch, or the installation of Hekate, so please go select the applicable/preferred installation configuration to your device, and come back when Hekate `v6.1.0` or newer is booted on the device.

## Configuring the JoyCons to Auto-Pair
1. In Hekate, select "Nyx Settings" in the bottom-left of the screen, then "Dump Joy-Con BT" from the top-right.
2. Click "OK" once a  message indicates success, the message will look like this:
```
Success!
Found 2 out of 2 Joy-Con Pairing data!
Both pairing data are HOS based!
```
    {% include alerts/note.html content="You must have booted HOS (the stock Nintendo Switch OS) with your preferred JoyCons attached prior to doing this, or it will likely not succeed." %}

## Partitioning the System
1. Please back up ALL data on the SD Card before proceeding with installation, as all data/games/save data stored on the SD Card will be erased in the process of installation.
2. In Hekate, select "Tools" in the top-center of the screen, then "Partition SD Card", then click "OK" when prompted.
3. Now, make your partition scheme selections based on your needs, as well as any other operating systems you may plan to install alongside Android.
    {% include alerts/note.html content="Please give Android no less than roughly 10 GB to ensure that enough space is present." %}
4. When content with your selections, click "Next Step" in the bottom-right of the screen, then when ready click "Start", then follow the on-screen instructions to proceeed with the partitioning process.
5. When the process is complete, select "Flash Android" and accept the prompt to reboot to recovery.
