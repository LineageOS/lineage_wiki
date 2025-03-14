---
sidebar: home_sidebar
title: Building and installing for libvirt QEMU virtual machine
permalink: libvirt-qemu.html
---

{% include alerts/warning.html content="The following `virtio_*` build targets are not officially supported and are maintained by individual LineageOS maintainers. Due to this, unlike Cuttlefish/Emulator/AVD which is guaranteed to function when built, `virtio_*` build targets carry no such guarantee." %}
{% include alerts/warning.html content="None of the `virtio_*` build targets are built by LineageOS build servers, and no OTA updates will be delivered to builds of these targets. As such, you must build all images and update the builds manually." %}

## Known issues

Please note the following list of yet unresolved known issues of the `virtio_*` targets:

* Display color (only with Swiftshader graphics selected)
* Video playback (by default with Mesa graphics, which is the most common use case)

## Introduction

This is a good option if you want to use LineageOS without a physical device, test Generic System Images (GSIs), or experiment with low-level Android components.

{% include alerts/tip.html content="For Android application development and debugging, [Emulator/AVD](emulator.html) is a better choice." %}

These instructions will help you build a LineageOS image that is suitable to run in libvirt QEMU virtual machine.

{% include templates/device_build_before_init.md %}

### Initialize the LineageOS source repository

The following branches are currently supported for building image for libvirt QEMU virtual machine:

* lineage-21.0
* lineage-22.0
* lineage-22.1
* lineage-22.2

{% include snippets/branches.md %}
{% include templates/device_build_init_sync.md %}

## Select the target to build

Setup the environment:
```
source build/envsetup.sh
```

Virtual A/B partition scheme is used by default. If you would like to use non-A/B partition scheme instead (which requires less space), run the following command prior to each build:
```
export AB_OTA_UPDATER=false
```

To build one of the targets in the table below, run the following command:
```
breakfast <Target>
```

|      Target       |      Architecture     |    Type    |
|-------------------|-----------------------|------------|
| virtio_arm64      | ARM (32-bit + 64-bit) | PC         |
| virtio_arm64only  | ARM (64-bit only)     | PC         |
| virtio_x86_64     | x86 (64-bit only)     | PC         |
| virtio_x86_64_car | x86 (64-bit only)     | Automotive |
| virtio_x86_64_tv  | x86 (64-bit only)     | Android TV |
{: .table }

Alternatively, run these commands to build one of the sub-targets:
```
breakfast <Main target>
breakfast <Sub target>
```

|   Main target    |      Sub target      |           Architecture           |    Type    | Available since |
|------------------|----------------------|----------------------------------|------------|-----------------|
| virtio_arm64only | virtio_arm64only_16k | ARM (64-bit only, 16KB pagesize) | PC         | LineageOS 22.0  |
| virtio_arm64only | virtio_arm64only_go  | ARM (64-bit only)                | Android Go | LineageOS 21.0  |
| virtio_x86_64    | virtio_x86_64_go     | x86 (64-bit only)                | Android Go | LineageOS 21.0  |
{: .table }

{% include alerts/important.html content="Running one of the x86_64 targets require a CPU which supports the SSE 4.2 instruction set, otherwise it will not boot." %}

{% include alerts/warning.html content="Some old entry level x86_64 CPUs may also would not be able to run the x86_64 targets. For example, in the Intel® Haswell family, Intel Core i3 CPUs will run it without problems. However, when running on Intel Celeron® CPUs, Android will fail to boot with logcat messages like `IKeystoreService` fails to start." %}

{% include alerts/important.html content="If you wish to run the virtual machine on ARMv9 devices (with hardware acceleration), you must select the `virtio_arm64only` target. The `virtio_arm64` target will not boot on these processor variants, as they don't support 32-bit mode." %}

{% include alerts/tip.html content="For ARMv8 devices, either `virtio_arm64` or `virtio_arm64only` would work (with hardware acceleration). The main difference is, the `virtio_arm64only` target does not support 32-bit only applications or tools." %}

## Start the build

Time to start building!

To build the installation image:
```
m espimage-install
```

If the build completed without errors, the installation image will appear at `out/target/product/<target>/lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.img`.

(Optional) Alternatively, you could also build installation image in ISO9660 format (only available for x86_64 targets):
```
m isoimage-install
```

If the build completed without errors, the installation image will appear at `out/target/product/<target>/lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.iso`.

Now, transfer the installation image to the device which you wish to run it on.

## Install the virtual machine software

On Debian / Ubuntu, installing the package `virt-manager` package will install the GUI manager and all necessary dependencies for the libvirt QEMU virtual machine.

Run the following command to install it:
```
sudo apt install virt-manager
```

Additionally, install the following packages according to your build's architecture:

| Android Architecture  |       Packages to install        |
|-----------------------|----------------------------------|
| ARM (32-bit + 64-bit) | qemu-system-arm qemu-efi-aarch64 |
| ARM (64-bit only)     | qemu-system-arm qemu-efi-aarch64 |
| x86 (64-bit only)     | qemu-system-x86 ovmf             |
{: .table }

## Create and configure the virtual machine using `virt-manager`

{% include alerts/warning.html content="This section uses Debian 12 (bookworm) as example. The instructions for other OSes may differ." %}

Launch `virt-manager`, by opening "Virtual Machine Manager" from the Application menu, or type it on Terminal.

### Virtual machine creation and common configurations

First, enable XML editing by toggling `Edit` > `Preferences` > `General` > `Enable XML editing`.

Next, create a new virtual machine by selecting `File` > `New Virtual Machine` from the menu bar. A "New VM" window will appear.

#### Step 1

Select `Manual install`, expand `Architecture options`, and select the correct architecture for the built image, as described below:

| Android Architecture  | QEMU Architecture |
|-----------------------|-------------------|
| ARM (32-bit + 64-bit) | aarch64           |
| ARM (64-bit only)     | aarch64           |
| x86 (64-bit only)     | x86_64            |
{: .table }

After selecting the correct architecture, click `Forward`.

#### Step 2

Search and select `Generic Linux 2022` on `Select the operation system you are installing` field. Click `Forward`.

#### Step 3

Specify the number of CPU cores and the size of memory that you're willing to allocate to the virtual machine.
Minimal RAM requirement is 2048 MiB. After populating these fields, click `Forward`.

#### Step 4

Untoggle `Enable storage for this virtual machine`, as we will setup storage for this virtual machine later. After doing this, click `Forward`.

#### Step 5

Specify the name that you would like to assign to the virtual machine,
and select the network which you wish to connect to in `Network selection` menu, click `Forward`.

#### Select `Chipset` or `Machine` and `Firmware`

The virtual machine configuration window will pop up.

On the `Overview` tab, select `Chipset` or `Machine` and `Firmware` type according to the architecture, as described below:

| Android Architecture  | Chipset / Machine |                       Firmware                       |
|-----------------------|-------------------|------------------------------------------------------|
| ARM (32-bit + 64-bit) | virt (required)   | Custom: /usr/share/AAVMF/AAVMF_CODE.no-secboot.fd    |
| ARM (64-bit only)     | virt (required)   | Custom: /usr/share/AAVMF/AAVMF_CODE.no-secboot.fd    |
| x86 (64-bit only)     | Q35 (recommended) | BIOS or UEFI x86_64: /usr/share/OVMF/OVMF_CODE_4M.fd |
{: .table }

Click `Apply`.

On `Memory` tab, toggle `Enable shared memory`, click `Apply`.

### Create virtual disks

1. Click `Add Hardware` on the bottom left corner, new window `Add New Virtual Hardware` will appear.
2. Select `Storage`, select `Disk device` on `Device type` menu, and select `VirtIO` on `Bus type` menu.
3. Fill in the disk size.
    {% include alerts/note.html content="Virtual A/B build (default) requires 13 GiB of size for the first disk, and non-A/B build requires 5 GiB of size for the first disk." %}
4. Click `Finish`.
5. Repeat the above steps, to add disk for storing userdata. Minimum size of 2 GiB is recommended.

### Attach the installation image

1. Click `Add Hardware` on the bottom left corner, new window `Add New Virtual Hardware` will appear.
2. Select `Storage`.
3. If the installation image is in ISO9660 format, select `CDROM device` on `Device type` menu, and select `SATA` on `Bus type` menu; Otherwise, select `Disk device` on `Device type` menu, and select `USB` on `Bus type` menu.
4. Expand `Advanced`, toggle `Readonly`.
5. Select `Select or create custom storage`, select the installation image.
6. Click `Finish`.
7. On `Boot Options` tab, toggle `SATA CDROM 1` or `USB Disk 1`, click `Apply`.

### Configure virtual machine input

#### Tablet or Mouse

Use a tablet input device if you're using a touchscreen or controlling the virtual machine remotely.

Tablet input devices are supported in all scenarios since LineageOS 22.
With tablet input device, you can move the mouse cursor across the border without grabbing the mouse cursor.
However, tablet input devices are unsupported in recovery mode in versions earlier than LineageOS 22.2.

{% include alerts/note.html content="Both EvTouch and VirtIO types of tablets are supported." %}

Otherwise, use mouse input device.

When using mouse input device, you have to click on the display area to grab the mouse cursor into the virtual machine,
and press `Ctrl+Alt` to release the mouse cursor from the virtual machine. It is supported in recovery mode too.

{% include alerts/note.html content="Both PS/2 and USB types of mice are supported." %}

#### Keyboard

Keyboard is always needed. Ensure there is a keyboard included in virtual machine hardware.

{% include alerts/note.html content="Please select either PS/2 or USB type of keyboard. VirtIO keyboard will not work on the boot menu." %}

### Configure virtual machine graphics

#### Video

1. If `Video` tab is missing, add it using the `Add Hardware` button on the bottom left corner.
2. On `Video` tab, select `Virtio` on `Model` menu, click `Apply`.
3. If the device and the remote desktop application supports 3D accelerated graphics, Toggle `3D acceleration`, click `Apply`.
4. (Optional) To specify custom display resolution, switch to the `XML` tab, insert `<resolution x="<Width>" y="<Height>"/>`, like this:
    ```
    <video>
    <model type="virtio" heads="1" primary="yes">
        <acceleration accel3d="yes"/>
        <resolution x="1920" y="900"/>
    </model>
    <alias name="video0"/>
    <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x0"/>
    </video>
    ```

{% include alerts/warning.html content="Some rare host video cards may not display 3D accelerated graphics properly. If that happens, please untoggle 3D acceleration." %}

#### Display

1. If `Display` tab is missing, add it using the `Add Hardware` button on the bottom left corner.
2. Open `Display` tab.
3. Select `None` on `Listen type` menu.
4. If `3D acceleration` is enabled on `Video` tab, toggle `OpenGL`, and choose an active host video card from the menu below.
5. Click `Apply`.

### Configure virtual machine sound

Sound card model `AC97` (which is the default) is recommended. Other models might work too but may have issues.

{% include alerts/important.html content="The `aarch64` architecture does not have a sound card added by default. You will have to add it manually." %}

### Create the new virtual machine

Click `Begin Installation` in the top left corner, the installation process will proceed, and then the virtual machine will start for the first time.

## Install LineageOS to the virtual machine

The virtual machine should boot into the boot manager menu of the installation image.

1. Select the first option called something akin to `Install LineageOS` using arrow keys, and then press Enter.
2. The virtual machine should enter LineageOS Recovery. You could select an option using arrow keys and enter it by pressing Enter.
3. Select `Factory reset` > `Format data/factory reset` > `Format data`.
4. Select `Apply update` > `Choose INSTALL` > Select `lineage-*-{{ site.time | date: "%Y%m%d" }}-UNOFFICIAL-<target>.zip`.

Congratulations! You now have installed LineageOS in the virtual machine.

You can now select `Reboot system now` to boot into LineageOS.

## Run LineageOS inside the virtual machine

The virtual machine should enter LineageOS boot menu.

Select the first option (which should be automatically selected by default) to boot LineageOS.

## Run Generic System Images inside the virtual machine

{% include alerts/warning.html content="We do not guarantee every GSIs provides the same functionality level as the main OS." %}

Here we will utilize GSIs from the Android Open Source Project website as example. There are three ways to run it:

### Dynamic System Updates

{% include alerts/tip.html content="This is the most convenient method." %}

{% include alerts/important.html content="Make sure the userdata disk is not too small. Minimum size of 8 GiB is recommended." %}

1. When booted into Launcher, open Settings app.
2. Enable `Developer options`, go back to homepage, navigate to `System` > `Developer options`.
3. Open `DSU Loader`, select the DSU package that you wish to install, click `Agree`.
4. Once the installation finishes, you could reboot to the GSI by clicking `Restart` on `Dynamic System Updates` notification.

### Specify GSI image as the third VirtIO disk

1. Download a GSI image archive (equal or higher Android version with matching architecture) from [Generic System Image releases](https://developer.android.com/topic/generic-system-image/releases).
2. Extract `system.img` from the downloaded archive.
3. Add `system.img` as the third VirtIO disk.
4. Boot the virtual machine into recovery mode, perform factory reset.
5. Reboot to boot menu, select `Advanced options` > `Boot GSI from /dev/block/vdc with LineageOS * (Kernel version *)`.

### Flash GSI image to `system` logical partition

1. Download a GSI image archive (equal or higher Android version with matching architecture) from [Generic System Image releases](https://developer.android.com/topic/generic-system-image/releases).
2. Extract `system.img` from the downloaded archive.
3. Boot the virtual machine into recovery mode, and perform a factory reset.
4. Enter fastbootd mode by selecting `Advanced` > `Enter fastboot`.
5. Delete unneeded logical partitions, and flash the GSI image, using `fastboot`:
    ```
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition product
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition product_a
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition product_b
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition system_ext
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition system_ext_a
    fastboot -s tcp:<IPv4 address that shown on menu header> delete-logical-partition system_ext_b
    fastboot -s tcp:<IPv4 address that shown on menu header> flash system <path to GSI system.img>
    ```
6. Reboot to boot menu, proceed with the first option.

## Details for advanced users

### ADB connection

These targets offer ADB connectivity over Ethernet or VirtIO VSOCK.

To connect over Ethernet, run the following command:
```
adb connect <IPv4 address of the virtual machine>
```

To connect over VirtIO VSOCK, add `VirtIO VSOCK` virtual hardware before the virtual machine is started, and run the following command:
```
adb connect vsock:<Guest CID>:5555
```

### Fastbootd connection

These targets offers fastbootd connection through Ethernet.

Here's how to use fastbootd over Ethernet:
```
fastboot -s tcp:<IPv4 address that shown on menu header> [fastboot command...]
```

### GPU passthrough (for `virtio_x86_64` target)

Since LineageOS 22.1, the `virtio_x86_64` target supports direct display on a monitor connected to a real GPU via GPU passthrough in normal boot mode.

Currently, only Intel GPUs (iGPU or dGPU) are supported.

{% include alerts/note.html content="Neither the display color issue nor the video playback issue will likely occur on Intel GPUs." %}

{% include alerts/warning.html content="There is no guarantee that every GPU models will work fine without any problem. Initial testing used Intel® HD Graphics 4600. If you have fixes for any GPU, feel free to submit!" %}

#### Additional build dependencies required for Intel Broadwell and later GPUs

* Install the package `python3-ply`.
* Provide Intel OpenCL C compiler executable at `prebuilts/intel-clc/intel_clc`.

#### Add GPU to the virtual machine

1. Enable VT-d (Intel) or IOMMU (AMD) in BIOS settings on the host PC.
2. Stop any driver from using the GPU on the host OS.
3. Probe `vfio-pci` kernel module with `ids` parameter containing PCI ID(s) of the GPU on the host OS.
4. Add PCI device of the GPU to the virtual machine at PCI bus `0x00` slot `0x1e`.

#### Start the virtual machine with GPU passthrough

When on the boot menu, enter `Advanced options (virtio_x86_64 specific)` submenu, and select the option that corresponds to the GPU and/or your usecase.

If something that's related with graphics doesn't work in GPU passthrough mode, you could firstly try booting in SELinux Permissive mode by selecting `Settings` > `SELinux` > `Permissive` on boot menu before booting.

### Install flashable ZIPs in recovery mode

#### ADB sideload

ADB sideload (over Ethernet or VirtIO VSOCK) on these targets is supported since LineageOS 22.1.

To establish the connection, refer to [ADB connection](#adb-connection).

#### Export a directory as VirtioFS share

Add `Filesystem` virtual hardware, specify the directory containing the custom flashable ZIPs in the `Source path` box, and specify `share` in the `Target path` box.

When in recovery mode, enter `Apply update` > `Choose from virtiofs`, select the custom flashable ZIP which you want to install.

#### Insert a USB drive

Put the flashable ZIP into a USB drive, and mount the USB drive to the virtual machine.

When in recovery mode, select `Apply update`, and volumes of the USB drive should appear on the menu. Select the corresponding volume, then select the custom flashable ZIP which you want to install.

### Text consoles

* The first serial console is used for interacting with GRUB text menu and printing kernel messages.
* The first VirtIO console is used for interacting with Android shell environment.
* The second VirtIO console is used for printing Android logcat messages.
