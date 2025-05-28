---
sidebar: home_sidebar
title: Building and installing for UTM virtual machine on Apple Silicon Mac
permalink: utm-vm-on-apple-silicon-mac.html
---

{% include alerts/warning.html content="This is not officially supported and is maintained by individual LineageOS maintainers. Due to this, unlike Cuttlefish/Emulator/AVD which is guaranteed to function when built, these targets carry no such guarantee." %}
{% include alerts/warning.html content="None of the `virtio_*` build targets are built by LineageOS build servers, and no OTA updates will be delivered to builds of these targets. As such, you must build all images and update the builds manually." %}

## Known issues

Please refer to [here](libvirt-qemu.html#known-issues).

{% include alerts/note.html content="Swiftshader graphics is unnecessary for normal usecases on Apple Silicon Mac." %}

## Introduction

Similar to [libvirt QEMU virtual machine](libvirt-qemu.html#introduction), this also offers a LineageOS experience inside a QEMU-based virtual machine.

The UTM app is a popular non-commercial virtual machine app made for Apple iOS and macOS, built on QEMU.

Note that we currently only document this for the use on Apple Silicon Macs.

The `virtio_*` targets are also suitable for use in a UTM virtual machine.

{% include templates/device_build_before_init.md %}

### Initialize the LineageOS source repository

The following branches are currently supported for building a UTM virtual machine package:

* lineage-21.0
* lineage-22.0
* lineage-22.1
* lineage-22.2

{% include snippets/branches.md %}
{% include templates/device_build_init_sync.md %}

## Select the target to build

Please refer to [this](libvirt-qemu.html#select-the-target-to-build) to help select your target.

{% include alerts/tip.html content="It is highly recommended to select one of the `ARM (64-bit only)` architecture targets. Other targets will also function in UTM virtual machine on Apple Silicon Mac (in emulation mode instead of virtualization mode), however their performance will be much worse." %}

## Start the build

Time to start building!

To build the ZIP archive containing UTM virtual machine package with LineageOS pre-installed:
```
m vm-utm-zip
```

If the build completed without errors, the ZIP archive will appear at `out/target/product/<target>/VirtualMachine/UTM/UTM-VM-lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.zip`.

Now, transfer the ZIP archive to the Apple Silicon Mac which you wish to run it on.

## Install UTM app

Please refer to the [UTM Documentation](https://docs.getutm.app/installation/macos/).

## Install the virtual machine

Locate the ZIP archive `UTM-VM-lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.zip` in Finder.

Double-click on it to decompress it.

After the decompression process finishes, the UTM virtual machine package named `LineageOS_on_<Architecture>.utm` will appear in the same directory.

Double-click on the package, the UTM main window will appear, and the virtual machine will be loaded on UTM with the name `LineageOS on <Architecture>`.

### Set the renderer backend

If the renderer backend `ANGLE (Metal)` is used, the Android UI will not appear after Android finishes booting. It is necessary to ensure the renderer backend is always set to `ANGLE (OpenGL)` when using this virtual machine.

Click on an empty area of the UTM main window, click `UTM` on the menu bar, and then click `Settings`.

On the new window, switch to `Display` tab, select `ANGLE (OpenGL)` on the `Renderer Backend` dropdown menu, then close the window.

### Disable virtualization mode if necessary

If the target is `ARM (64-bit only)` architecture, proceed to the next step.

If not, please open virtual machine settings, switch to `QEMU` tab, untoggle `Use Hypervisor`, then close the window.

## Start the virtual machine

That's it! The virtual machine is ready to use.

Now, you can start the virtual machine.
