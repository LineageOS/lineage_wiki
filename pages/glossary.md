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
    blink(location.hash, lastHash);
    lastHash = location.hash;
  }

  function blink(hash, oldHash) {
    $(hash).addClass("highlighted");
    $(oldHash).removeClass("highlighted");
  }

  window.onhashchange = locationHashChanged;
</script>

#### Bootloader

- A low-level software part required for starting the actual OS. It stays untouched when installing a [custom ROM](#custom-rom)

#### Custom ROM

- A (self-)built Android version with changes on top of the [AOSP](https://source.android.com/) (Android Open Source Project)

#### Firmware

- Included in the [Stock ROM](#stock-rom). A layer of software required to connect the OS to the hardware.

#### Stock ROM

- The variant of Android the vendor/OEM put onto the device or sent via an update

