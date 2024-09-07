---
sidebar: home_sidebar
title: Building and installing for libvirt QEMU virtual machine
permalink: libvirt-qemu.html
---

{% include alerts/warning.html content="The following build targets are not officially supported and are maintained by individual LineageOS maintainers. Due to this, unlike Emulator/AVD which is guaranteed to function when built, `virtio` build targets carry no such guarantee." %}
{% include alerts/warning.html content="No `virtio` target is built by LineageOS build servers, and no OTA updates will be delivered to builds of these targets. As such, you must build all images and update the builds manually." %}

## Known issues

Please note the following list of yet unresolved known issues when running LineageOS on a libvirt QEMU virtual machine:

* Display color (only with Swiftshader graphics selected)
* Video playback (only with Mesa graphics selected, which is the most common use case)

## Introduction

If you would like to use LineageOS without setting up a physical device, try out Generic System Images (GSIs), or experiment with low-level Android components, this would be a good fit.

{% include alerts/tip.html content="If your goal is to develop and debug Android applications, then using [Emulator/AVD](emulator.html) is the better option." %}

These instructions will help you build a LineageOS image that is suitable to run in libvirt QEMU virtual machine.

{% include templates/device_build_before_init.md %}

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

Virtual A/B partition scheme is used by default. If you would like to use A-only partition scheme instead (which requires less space), run the following command prior to each build:
```
export AB_OTA_UPDATER=false
```

Select the build target by running the following command, where `<target>` is one of the entries in the table below:
```
breakfast <target>
```

|      Target       |      Architecture     |    Type    |
|-------------------|-----------------------|------------|
| virtio_arm64      | ARM (32-bit + 64-bit) | PC         |
| virtio_arm64only  | ARM (64-bit only)     | PC         |
| virtio_x86_64     | x86 (64-bit only)     | PC         |
| virtio_x86_64_car | x86 (64-bit only)     | Automotive |
| virtio_x86_64_tv  | x86 (64-bit only)     | Android TV |
{: .table }

{% include alerts/important.html content="Running one of the x86_64 targets require a CPU which supports the SSE 4.2 instruction set, otherwise it will not boot." %}

{% include alerts/important.html content="If you wish to run the virtual machine on ARMv9 devices (with hardware acceleration), you must select the `virtio_arm64only` target. The `virtio_arm64` target will not boot on these processor variants, as they don't support 32-bit mode." %}

{% include alerts/tip.html content="For ARMv8 devices, either `virtio_arm64` or `virtio_arm64only` would work (with hardware acceleration). The main difference is, the `virtio_arm64only` target does not support 32-bit only applications or tools." %}

Now, build the installation image:
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

On Debian / Ubuntu, installing the package `virt-manager` would install the GUI manager, and everything that required for libvirt QEMU virtual machine as well as their dependencies.

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

On the menu bar, select `File` > `New Virtual Machine`. A new window named "New VM" will pop up.

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

On the`Overview` tab, select `Chipset` or `Machine` and `Firmware` type according to the architecture, as described below:

| Android Architecture  | Chipset / Machine |                     Firmware                      |
|-----------------------|-------------------|---------------------------------------------------|
| ARM (32-bit + 64-bit) | virt (required)   | Custom: /usr/share/AAVMF/AAVMF_CODE.no-secboot.fd |
| ARM (64-bit only)     | virt (required)   | Custom: /usr/share/AAVMF/AAVMF_CODE.no-secboot.fd |
| x86 (64-bit only)     | Q35 (recommended) | UEFI x86_64: /usr/share/OVMF/OVMF_CODE_4M.fd      |
{: .table }

Click `Apply`.

On `Memory` tab, toggle `Enable shared memory`, click `Apply`.

### Create virtual disks

1. Click `Add Hardware` on the bottom left corner, new window `Add New Virtual Hardware` will appear.
2. Select `Storage`, select `Disk device` on `Device type` menu, and select `VirtIO` on `Bus type` menu.
3. Fill in the disk size.
    {% include alerts/note.html content="Virtual A/B build (default) requires 13 GiB of size for the first disk, and A-only build requires 5 GiB of size for the first disk." %}
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

If the device has a touchscreen and you would like to interact with the virtual machine using a touchscreen,
or if you are controlling from remote desktop, you must use tablet input device for the virtual machine.

{% include alerts/note.html content="Both EvTouch and VirtIO types of tablets are supported." %}

Otherwise, use mouse input device.

{% include alerts/note.html content="Both PS/2 and USB types of mice are supported." %}

#### Keyboard

Keyboard is always needed. Ensure there is a keyboard included in virtual machine hardware.

{% include alerts/note.html content="VirtIO, PS/2 and USB types of keyboards are supported." %}

### Configure virtual machine graphics

#### Video

1. If `Video` tab is missing, add it using the `Add Hardware` button on the bottom left corner.
2. On `Video` tab, select `Virtio` on `Model` menu, click `Apply`.
3. If the device and the remote desktop application supports 3D accelerated graphics, Toggle `3D acceleration`, click `Apply`.
4. (Optional) To specify custom display resolution, first enable `Edit XML` switch to the `XML` tab, insert `<resolution x="<Width>" y="<Height>"/>`, like this:
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
4. If `3D acceleration` is enabled on `Video` tab, toggle `OpenGL`, and select an active host video card on the menu below of `OpenGL` toggle.
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

If you'd like to install any additional add-on packages, you may do so now by repeating steps `1`, `2`, and `4`, substituting your add-on package into step `4`.

You can now select `Reboot system now` to boot into LineageOS.

## Run LineageOS inside the virtual machine

The virtual machine should enter LineageOS boot menu.

If the virtual machine is configured with 3D acceleration enabled, boot LineageOS by selecting the first option.

Otherwise, select `Advanced options` > `LineageOS * (Kernel version *) (Swiftshader graphics)`.

## Run Generic System Images inside the virtual machine

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
