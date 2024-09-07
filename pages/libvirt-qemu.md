---
sidebar: home_sidebar
title: Building and installing for libvirt QEMU virtual machine
permalink: libvirt-qemu.html
---

## Introduction

If you would like to use LineageOS without setting up development environment (such as Android Studio), or experiment with low-level Android components, this would be a good fit.

{% include alerts/tip.html content="If your goal is to develop Android apps, then using Emulator/AVD is a better option." %}

The below instructions will help you build an LineageOS image that suits for libvirt QEMU virtual machine and run it.

{% include templates/device_build_before_init.md %}

## Known issues

This is a list of unresolved (yet) known issues on LineageOS on libvirt QEMU virtual machine:

* Display color (only with Swiftshader graphics)
* Video playback (only with Mesa graphics, which is the most common usecase)

### Initialize the LineageOS source repository

The following branches are currently supported for building image for libvirt QEMU virtual machine:

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

{% include alerts/tip.html content="For ARMv8 PCs, either `virtio_arm64` or `virtio_arm64only` would work with hardware acceleration. The main difference is, `virtio_arm64only` target would not support 32-bit only applications." %}

Now, build the installation image:
```
mka espimage-install
```

If the build completed without errors, the installation image will appear at `out/target/product/<target>/lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.img`.

Now, transfer the installation image to the PC which you wish to run it on.

## Install the virtual machine software

On Debian / Ubuntu, installing the package `virt-manager` would install the GUI manager, and everything that required for libvirt QEMU virtual machine as well as theirs dependencies.

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

## Create and configure virtual machine using `virt-manager`

{% include alerts/warning.html content="This section uses Debian 12 (bookworm) for example. The instructions for other OS versions may differ." %}

Launch `virt-manager`, by opening "Virtual Machine Manager" from the Application menu, or type it on Terminal.

### Virtual machine creation and common configurations

On the menu bar, select `File` > `New Virtual Machine`. A new window named "New VM" will pop up.

#### Step 1

Select `Manual install`. Expand `Architecture options`, select the correct architecture for the built image, as descripted below:

| Android Architecture | QEMU Architecture |
|----------------------|-------------------|
| ARM (64-bit)         | aarch64           |
| ARM (64-bit only)    | aarch64           |
| x86 (64-bit only)    | x86_64            |
{: .table }

After selecting the correct Architecture, click `Forward`.

#### Step 2

Select `Generic Linux 2022` on `Select the operation system you are installing` field. Click `Forward`.

#### Step 3

Specify the number of CPU cores and the size of Memory that you're willing to allocate to the virtual machine.
Minimal RAM requirement is 2048 MiB. After filling these, click `Forward`.

#### Step 4

Unselect `Enable storage for this virtual machine`. We will setup storage for this virtual machine later. Click `Forward.`

#### Step 5

Specify the name that you would like to assign to the virtual machine,
Select the network which you wish to connect to in `Network selection` menu, click `Forward.`

#### Set `Chipset` or `Machine` and `Firmware`

The virtual machine configuration window will appear.

On `Overview` tab, select `Chipset` or `Machine` and `Firmware` type according to the architecture, as descripted below:

FIXME

| Android Architecture | Chipset / Machine |                   Firmware                   |
|----------------------|-------------------|----------------------------------------------|
| ARM (64-bit)         | virt (required)   | UEFI aarch64: /usr/share/AAVMF/AAVMF_CODE.fd |
| ARM (64-bit only)    | virt (required)   | UEFI aarch64: /usr/share/AAVMF/AAVMF_CODE.fd |
| x86 (64-bit only)    | Q35 (recommended) | UEFI x86_64: /usr/share/OVMF/OVMF_CODE_4M.fd |
{: .table }

Click `Apply`.

On `Memory` tab, toggle `Enable shared memory`, click `Apply`.

### Create virtual disks

1. Click `Add Hardware` from the bottom left corner, new window `Add New Virtual Hardware` will appear.

2. Select `Storage`, select `Disk device` on `Device type` menu, select `VirtIO` on `Bus type` menu.

3. Fill in the disk size. Click `Finish`.

{% include alerts/note.html content="Virtual A/B build (default) requires 13 GiB of size for the first disk, and A-only build requires 5 GiB of size for the first disk." %}

4. Repeat the above steps, to add disk for storing userdata. Minimum size of 2 GiB is recommended.

### Attach the installation image

1. Click `Add Hardware` from the bottom left corner, new window `Add New Virtual Hardware` will appear.

2. Select `Storage`, select `Disk device` on `Device type` menu, select `USB` on `Bus type` menu.

3. Expand `Advanced`, toggle `Readonly`.

4. Select `Select or create custom storage`, select the installation image.

5. Click Finish.

6. On `Boot Options` tab, toggle `USB Disk 1` FIXME, click `Apply`.

### Configure virtual machine input

#### Tablet or Mouse

If the PC has a touchscreen and you would like to interact with the virtual machine using touchscreen,
or if you are controlling from remote desktop, you should use Tablet input device for the virtual machine.

{% include alerts/note.html content="Both EvTouch and VirtIO type of tablet are supported." %}

Otherwise, use Mouse input device.

{% include alerts/note.html content="Both PS/2 and USB type of mouse are supported." %}

#### Keyboard

Keyboard is always needed. Ensure there is a Keyboard included in virtual machine hardware.

{% include alerts/note.html content="VirtIO, PS/2 and USB type of keyboard are supported." %}

### Configure virtual machine graphics

#### Video

On `Video` tab, select `Virtio` on `Model` menu, click `Apply`.

If the PC and the Remote Desktop application (if you're viewing from it) supports 3D Accelerated graphics,
you shall follow the below steps to configure 3D Acceleration; Otherwise, skip to the next section.

Toggle `3D acceleration`, click `Apply`.

#### Display

On `Display` tab, select `None` on `Listen type` menu, toggle `OpenGL`, select a active host video card on the menu below it, click `Apply`.

### Configure virtual machine sound

Sound card model `AC97` (which is the default) is recommended. Other models shall work too, but may have issues.

### Install the new virtual machine

Click `Begin Installation` on the top left corner, installation process would happen, and then the virtual machine would run.

## Install LineageOS to the virtual machine

The virtual machine should boot into the boot manager menu of the installation image.

1. Select the first option that begins with `Install LineageOS` using arrow keys, press Enter.

2. The virtual machine should enter LineageOS Recovery. You can select a option using arrow keys and enter it by pressing Enter.

3. Select `Factory reset` > `Format data/factory reset` > `Format data`.

4. Select `Apply update` > `Choose from INSTALL` > `lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.zip`.

Congratulations! You now have LineageOS installed in the virtual machine.

You can now select `Reboot system now` to start using LineageOS.

## Run LineageOS inside the virtual machine

The virtual machine should now enter the LineageOS boot menu.

If the virtual machine is configured with 3D Acceleration enabled, boot LineageOS by selecting the first option.

Otherwise, select `Advanced options` > `LineageOS * (Kernel version *) (Swiftshader graphics)`.

## Run Generic System Image inside the virtual machine

Here we use GSIs from Android Open Source Project website as example. There are three ways to run it:

### Dynamic System Updates (Easiest)

1. When booted into Launcher, open Settings app.

2. Enable Developer options, go back to homepage, navigate to `System` > `Developer options`.

3. Open `DSU Loader`, select the DSU Package you wish to install, click `Agree`.

4. Once the installation finishes, you can enter the GSI by clicking `Restart` on `Dynamic System Updates` notification.

### Pass GSI image to the third VirtIO disk

1. Download a GSI image archive (with matching architecture) from [Generic System Image releases](https://developer.android.com/topic/generic-system-image/releases).

2. Extract `system.img` from the downloaded archive,

3. Add the `system.img` as the third VirtIO disk.

4. Boot the virtual machine into recovery mode, perform a Factory reset.

5. Reboot to boot menu, select `Advanced options` > `Boot GSI from /dev/block/vdc`.

### Flash GSI image to `system` logical partition

1. Download a GSI image archive (with matching architecture) from [Generic System Image releases](https://developer.android.com/topic/generic-system-image/releases).

2. Extract `system.img` from the downloaded archive,

3. Boot the virtual machine into recovery mode, perform a Factory reset.

4. Enter fastbootd mode by selecting `Advanced` > `Enter fastboot`.

5. Delete unused logical partitions, and flash the GSI image, using `fastboot`:

```
fastboot -s tcp:<IPv4 Address that showed on menu header> delete-logical-partition product
fastboot -s tcp:<IPv4 Address that showed on menu header> delete-logical-partition system_ext
fastboot -s tcp:<IPv4 Address that showed on menu header> flash system <path to GSI system.img>
```

6. Reboot to boot menu, proceed with the first option.
