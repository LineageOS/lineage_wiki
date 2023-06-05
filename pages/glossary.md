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

- A general term for a link in the boot-chain that has a specific job that is run each cold-boot
- Usually untouched by installing a [Custom ROM](#custom-rom)

#### Bootloop

- A word indicating that the device is never reaching the end of its boot phase and starting over
- Useless when used in describing an error, since there are many points in time during a device boot where it might abort and start over, e.g.
  - At the vendor logo
  - Looping the LineageOS bootanimation endlessly
  - Reaching the login screen or setup but immediately turning back to the vendor logo
  - etc.

#### Bricked

- A device can not be recovered from a fatal failure by any means, leaving it in a state of either not powering on at all or crashing to some kind of
  error message
- People often use this word in places where they just mean a [Bootloop](#bootloop) and their issue can be fixed using either button presses or readily available software tools

#### Custom ROM

- A (self-)built Android version with changes on top of the [AOSP](https://source.android.com/) (Android Open Source Project)

#### Degoogled

- A term describing that an OS has no software parts from and making connections to Google
- LineageOS is not explicitly degoogled, we simply don't ship [GApps](#gapps) due to licensing

#### Firmware

- Included in the [Stock ROM](#stock-rom). A layer of software required to connect the OS to the hardware.
- Not the same as a [Custom ROM](#custom-rom) or ROM in general but sometimes included with them

#### GApps

- Google Apps, usually consisting of the GMS (Google Mobile Services), the Play Store and a varying amount of the native Apps made by Google (Dialer, Messenger, Calender, etc)
- Not preinstalled on LineageOS but can be installed **during** installation of LineageOS

#### OEM

- Original Equipment Manufacturer, the one who made a device

#### Stock ROM

- The variant of Android the vendor/[OEM](#oem) put onto the device or sent via an update

#### Unlocked

- There are two types of unlocked devices:
  - Carrier unlocked: you can use the device with SIM cards of any carrier
  - Bootloader unlocked: the one you need to install a [Custom ROM](#custom-rom)
- Some carriers allow for (or are obliged to do so by law) removing the sim lock but still won't allow to unlocking the bootloader
