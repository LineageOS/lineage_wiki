---
sidebar: home_sidebar
title: Building for libvirt QEMU virtual machine
permalink: libvirt-qemu.html
---

## Introduction

If you would like to use LineageOS inside a libvirt QEMU virtual machine, or try out recent Generic System Images, or experiment with low-level Android components, this would be a good fit.

{% include alerts/tip.html content="If your goal is to develop Android frameworks or apps, then using Emulator/AVD is a better option." %}

The below instructions will help you build an LineageOS image that suits for libvirt QEMU virtual machine and run it.

## Known issues

This is a list of unresolved (yet) known issues on LineageOS on libvirt QEMU virtual machine:

* Display color (only with Swiftshader graphics)
* Video playback (only with Mesa graphics, which is the most common usecase)


{% include templates/device_build_before_init.md %}


### Initialize the LineageOS source repository

The following branches are supported for building image for libvirt QEMU virtual machine:

* lineage-21.0

{% include snippets/branches.md %}
{% include templates/device_build_init_sync.md %}

### Start the build

Time to start building!

Setup the environment:
```
source build/envsetup.sh
```
Select the build target by running the following command, where `<target>` is one of the entries in the table below:

```
breakfast <target>
```

|   Build target    |    Architecture    |    Type    |
|-------------------|--------------------|------------|
| virtio_arm64      | ARM (64-bit)       | PC         |
| virtio_arm64only  | ARM (64-bit only)  | PC         |
| virtio_x86_64     | x86 (64-bit only)  | PC         |
| virtio_x86_64_car | x86 (64-bit only)  | Automotive |
| virtio_x86_64_tv  | x86 (64-bit only)  | TV         |
{: .table }

{% include alerts/important.html content="If you wish to run the virtual machine on ARMv9 PCs with hardware acceleration, you should choose `virtio_arm64only` target. The target `virtio_arm64` would not boot." %}

{% include alerts/tip.html content="For ARMv8 PCs, Either `virtio_arm64` or `virtio_arm64only` would work with hardware acceleration. The main difference is, `virtio_arm64only` target would not support 32-bit only applications." %}

Now, build the installation image:
```
mka espimage-install
```

If the build completed without errors, the output will appear at `out/target/product/<target>/lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.img`.

Finally, transfer the output to the PC which you wish to run it on.

## Install `virt-manager` and libvirt QEMU

On Debian 12 host, Installing the package `virt-manager` would install the GUI manager, and everything that required for libvirt QEMU virtual machine as its dependencies.

## Create and configure libvirt QEMU virtual machine using `virt-manager`

TODO

## Install LineageOS inside the virtual machine

TODO

## Run LineageOS inside the virtual machine

TODO

## Run Generic System Image inside the virtual machine

TODO
