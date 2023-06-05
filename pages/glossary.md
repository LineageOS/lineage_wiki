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

- A low-level software part required for starting the actual OS. It stays untouched when installing a [custom ROM](#custom-rom)

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
- People often use this word wrongly when all they need to recover is an easily available software tool

#### Custom ROM

- A (self-)built Android version with changes on top of the [AOSP](https://source.android.com/) (Android Open Source Project)

#### Firmware

- Included in the [Stock ROM](#stock-rom). A layer of software required to connect the OS to the hardware.

#### Stock ROM

- The variant of Android the vendor/OEM put onto the device or sent via an update

