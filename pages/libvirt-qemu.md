---
sidebar: home_sidebar
title: Building for libvirt QEMU virtual machine
permalink: libvirt-qemu.html
---

## Introduction

If you would like to use LineageOS without setting up development environment (such as Android Studio), or experiment with low-level Android components, this would be a good fit.

{% include alerts/tip.html content="If your goal is to develop Android apps, then using Emulator/AVD is a better option." %}

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

|      Target       |    Architecture    |    Type    |
|-------------------|--------------------|------------|
| virtio_arm64      | ARM (64-bit)       | PC         |
| virtio_arm64only  | ARM (64-bit only)  | PC         |
| virtio_x86_64     | x86 (64-bit only)  | PC         |
| virtio_x86_64_car | x86 (64-bit only)  | Automotive |
| virtio_x86_64_tv  | x86 (64-bit only)  | TV         |
{: .table }

{% include alerts/important.html content="x86 targets requires the CPU supporting SSE 4.2 instruction set." %}

{% include alerts/important.html content="If you wish to run the virtual machine on ARMv9 PCs with hardware acceleration, you should choose `virtio_arm64only` target. The target `virtio_arm64` would not boot." %}

{% include alerts/tip.html content="For ARMv8 PCs, Either `virtio_arm64` or `virtio_arm64only` would work with hardware acceleration. The main difference is, `virtio_arm64only` target would not support 32-bit only applications." %}

Now, build the installation image:
```
mka espimage-install
```

If the build completed without errors, the installation image will appear at `out/target/product/<target>/lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.img`.

Now, transfer the installation image to the PC which you wish to run it on.

## Install libvirt QEMU

On Debian / Ubuntu, Installing the package `virt-manager` would install the GUI manager, and everything that required for libvirt QEMU virtual machine as well as theirs dependencies.

Run the following command to install it:
```
sudo apt install virt-manager
```

Also, install the packages according to the architecture:

| Android Architecture |       Packages to install        |
|----------------------|----------------------------------|
| ARM (64-bit)         | qemu-system-arm qemu-efi-aarch64 |
| ARM (64-bit only)    | qemu-system-arm qemu-efi-aarch64 |
| x86 (64-bit only)    | qemu-system-x86 ovmf             |
{: .table }

## Create and configure libvirt QEMU virtual machine using `virt-manager`

{% include alerts/tip.html content="This section uses Debian 12 (bookworm) for example. The instructions for other OS versions may differ." %}

Launch `virt-manager`, by opening "Virtual Machine Manager" from the Application menu, or type it on Terminal.

### Virtual machine creation and common configurations

On the menu bar, Select `File` > `New Virtual Machine`. A new window named "New VM" will pop up.

On Step 1, Select `Manual install`. Expand `Architecture options`, Select the correct architecture for the built image, as descripted below:

| Android Architecture | QEMU Architecture |
|----------------------|-------------------|
| ARM (64-bit)         | aarch64           |
| ARM (64-bit only)    | aarch64           |
| x86 (64-bit only)    | x86_64            |
{: .table }

After selecting the correct Architecture, Click `Forward`.

On Step 2, Select `Generic Linux 2022` on `Select the operation system you are installing` field. Click `Forward`.

On Step 3, Specify the number of CPU cores and the size of Memory that you're willing to allocate to the virtual machine.
Minimal RAM requirement is 2048 MiB. After filling these, Click `Forward`.

On Step 4, Unselect `Enable storage for this virtual machine`. We will setup storage for this virtual machine later. Click `Forward.`

On Step 5, Specify the name that you would like to assign to the virtual machine,
Select the network which you wish to connect to in `Network selection` menu, Click `Forward.`

The virtual machine configuration window will appear.

On `Overview` tab, Select `Chipset` or `Machine` and `Firmware` type according to the architecture, as descripted below:

FIXME

| Android Architecture | Chipset / Machine |                   Firmware                   |
|----------------------|-------------------|----------------------------------------------|
| ARM (64-bit)         | virt (required)   | UEFI aarch64: /usr/share/AAVMF/AAVMF_CODE.fd |
| ARM (64-bit only)    | virt (required)   | UEFI aarch64: /usr/share/AAVMF/AAVMF_CODE.fd |
| x86 (64-bit only)    | Q35 (recommended) | UEFI x86_64: /usr/share/OVMF/OVMF_CODE_4M.fd |
{: .table }

Click `Apply`.

On `Memory` tab, Toggle `Enable shared memory`, Click `Apply`.

### Add disks

Click `Add Hardware` from the bottom left corner, New window `Add New Virtual Hardware` will appear.

Select `Storage`, Select `Disk device` on `Device type` menu, Select `VirtIO` on `Bus type` menu.

Virtual A/B build (default) requires 13 GiB of size for the first disk, and A-only build requires 5 GiB of size for the first disk.

Fill in the corresponding size. Click `Finish`.

Repeat the above steps, to add disk for storing userdata. Minimum size of 2 GiB is recommended.

### Attach the installation image

Click `Add Hardware` from the bottom left corner, New window `Add New Virtual Hardware` will appear.

Select `Storage`, Select `Disk device` on `Device type` menu, Select `USB` on `Bus type` menu.

Expand `Advanced`, Toggle `Readonly`.

Select `Select or create custom storage`, Select the installation image.

Click Finish.

On `Boot Options` tab, Toggle `USB Disk 1` FIXME, Click `Apply`.

### Configure virtual machine input

If the PC has a touchscreen and you would like to interact with the virtual machine using touchscreen, 
or if you are controlling from remote desktop, you should use Tablet input device for the virtual machine.

Otherwise, Use Mouse input device.

Keyboard is always needed. Ensure there is a Keyboard included in virtual machine hardware.

### Configure virtual machine graphics

On `Video` tab, Select `Virtio` on `Model` menu, Click `Apply`.

If the PC and the Remote Desktop application (if you're viewing from it) supports 3D Accelerated graphics,
you shall follow the below steps to configure 3D Acceleration; Otherwise, Skip to the next section.

Toggle `3D acceleration`, Click `Apply`.

On `Display` tab, Select `None` on `Listen type` menu, Toggle `OpenGL`, Select a active host video card on the menu below it, Click `Apply`.

### Install the new virtual machine

Click `Begin Installation` on the top left corner, installation process would happen, and then the virtual machine would run.

## Install LineageOS to the virtual machine

The virtual machine should boot into the boot manager menu of the installation image.

Select the first option that begins with `Install LineageOS` using arrow keys, Press Enter.

In next, The virtual machine should enter LineageOS Recovery. You can select a option using arrow keys and enter it by pressing Enter.

Select `Factory reset` > `Format data/factory reset` > `Format data`.

Select `Apply update` > `Choose from INSTALL` > `lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.zip`.

Congratulations! You now have LineageOS installed in the virtual machine.

You can now select `Reboot system now` to start using LineageOS.

## Run LineageOS inside the virtual machine

The virtual machine should now enter the LineageOS boot menu.

If the virtual machine is configured with 3D Acceleration enabled, Boot LineageOS by selecting the first option.

Otherwise, Select `Advanced options` > `LineageOS * (Kernel version *) (Swiftshader graphics)`.

## Run Generic System Image inside the virtual machine

Here we use GSIs from Android Open Source Project website as example. There are two ways to run it:

1. When booted into Launcher, Open Settings app, Enable Developer options, Go back to homepage, Navigate to `System` > `Developer options`,
Open `DSU Loader`, Select the DSU Package you wish to install, Click `Agree`. Once installation finishes, You can enter the GSI by clicking `Restart` on `Dynamic System Updates` notification.

2. Download a GSI image archive (with matching architecture) from [Generic System Image releases](https://developer.android.com/topic/generic-system-image/releases), Extract `system.img` from the downloaded archive,
Add the `system.img` as 3rd VirtIO disk, Boot the virtual machine into recovery mode, Do Factory reset, Reboot to boot menu, Select `Advanced options` > `Boot GSI from /dev/block/vdc`.
