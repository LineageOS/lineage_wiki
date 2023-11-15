---
title: Glossary
sidebar: home_sidebar
permalink: /glossary/
toc: false
---

<style>
  .highlighted {
    font-weight: normal;
    text-decoration: underline;
  }
</style>

<script type="text/javascript">
  var lastHash = "";
  $(window).on('load', function(){
    locationHashChanged();
  });

  function locationHashChanged(e) {
    highlight(location.hash, lastHash);
    lastHash = location.hash;
  }

  function highlight(hash, oldHash) {
    $(hash).addClass("highlighted");
    $(oldHash).removeClass("highlighted");
  }

  window.onhashchange = locationHashChanged;
</script>

#### Bootloader

- A general term for a link in the boot-chain that is run each cold-boot which loads the kernel, OS, and related components.

#### Bootloop

- A word indicating that the device never reaches the end of its boot phase and continually starts over
- Useless when used in describing an error, since there are many points in time during a device boot where it might abort and start over, e.g.
  - At the vendor splash logo
  - Looping the LineageOS bootanimation (a green circle moving across a line on the screen) endlessly
  - Reaching the lock screen or setup screen but immediately restarting
  - etc.

#### Bricked

- A device which cannot be recovered from a fatal failure by any means, leaving it in an unoperable state which is not recoverable by any means outside of OEM repair.
- People often use this word in places where they just mean a [Bootloop](#bootloop) and their issue can be fixed using either button presses or readily available software tools

#### Custom ROM

- A (self-)built Android version with changes on top of the [AOSP](https://source.android.com/) (Android Open Source Project)

#### Degoogled

- A term describing that an OS has no software parts from, or that attempt to connect to Google
- LineageOS is not explicitly degoogled, we simply don't ship [GApps](#gapps) due to licensing

#### Factory reset

- Despite the name containing "factory", performing such a reset is returning the device into a state "without user modifications", not back to the [Stock ROM](#stock-rom)

#### Firmware

- Included in the [Stock ROM](#stock-rom) - A layer of software required to allow the OS to interface with the hardware
- Not the same as a [Custom ROM](#custom-rom) or ROM in general but sometimes included in Custom ROM installation packages/instructions

#### GApps

- Google Apps, usually consisting of the GMS (Google Mobile Services), the Play Store, and a varying amount of the native Apps made by Google (Dialer, Messenger, Calender, etc)
- Google Apps are not preinstalled on LineageOS but can be installed **during** installation of LineageOS, please see your device's Install guide for more information.

#### OEM

- Original Equipment Manufacturer, the one who sells and manages software on a give device (e.g. Samsung, Motorola, Google)

#### Root

- People sometimes wrongfully use this when they mean [Unlocking](#Unlocked)
- Refers to being able to access and modify the contents of read-only partitions via apps or a shell (usually involving a "superuser" (su) binary)
- Some apps "detect" root access on LineageOS (which does not come rooted!) when they actually mean "modified device"
- LineageOS does not offer any rooting solution (despite `adb root`) and does not provide support to install any

#### Stock ROM

- The variant of Android the vendor/[OEM](#oem) shipped on the device from the factory, this applies to OTA (over-the-air) updates issued by the OEM

#### Unlocked

- There are two types of unlocking when discussing smartphones:
  - Carrier unlocking: You can use the device with SIM cards of any carrier
  - Bootloader unlocking: You can run unsigned operating systems/kernels. This is the type of unlock you need to install a [Custom ROM](#custom-rom)
- Some carriers allow for (or are obliged to do so by law) removing the SIM lock but still won't allow to unlocking the bootloader
- Some OEMs don't allow unlocking the bootloader
