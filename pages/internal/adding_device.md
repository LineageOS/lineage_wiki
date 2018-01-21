---
sidebar: home_sidebar
title: How to add a new device to the wiki
folder: internal
permalink: addingdevice-howto.html
search: exclude
tags:
 - internal
---

## Requirements for adding a device

The LineageOS wiki provides instructions based on the assumption that your device has got its device tree/kernel
under the [LineageOS GitHub organization](https://github.com/LineageOS), and that it supports building Lineage 13.0 or higher. If your device meets
both those requirements, follow the instructions below to get your device set up.

## Setting up the wiki locally

See [contributing using repo](contributing.html#using-repo) for detailed instructions on setting up the wiki locally.

## Adding your device

### Prepare the required files

There are a few files which need to be there to have a device on the wiki.
In order to get them, navigate to `$LINEAGE_SRC/lineage/wiki/` and run:

```
./scripts/generate_device.sh your_device
```

Obviously replace `your_device` with the codename of your device

### Populating the YAML

{% assign devices = "" | split: " " -%}
{%- for device in site.data.devices -%}
{%- assign devices = devices | push: device[1] -%}
{%- endfor %}

{%- assign all = " " | split: " " -%}
{%- for device in devices -%}
{%- for peripheral in device.peripherals -%}
{%- unless peripheral == "" or peripheral contains "not supported" or peripheral contains "only" -%}
{%- assign all = all | push: peripheral -%}
{%- endunless -%}
{%- endfor -%}
{%- endfor -%}
{%- assign sorted = all | uniq | sort -%}

The sample template has been copied to `$LINEAGE_SRC/lineage/wiki/_data/devices/your_device.yml`.
Update the values to match your device. An explanation of poorly-named/confusing options is below:

* `architecture`: The CPU architecture of the device, can be one of `arm`, `arm64`, `x86` or `x86_64`
  If your device has a 64 bit architecture but android runs on 32 bit, you can use a different format: `{cpu: 'arm64', userspace: 'arm'}`
* `battery`: Use the format `{removable: False, capacity: <number in mAh>, tech: '<tech>'}`. If your battery is removable, use `True` instead. For `tech` you can use `Li-Ion` or `Li-Po`.
  For devices with any kind of fast-charging, you can add `fastcharge: True` to the line.
  In case you are setting up one file for multiple devices which have different batteries, you can use Model-Value-Pairs, e.g.

  ```
  battery:
  - Model1: {removable: False, capacity: 1000, tech: 'Li-Ion'}
  - Model2: {removable: True, capacity: 2000, tech: 'Li-Po', fastcharge: True}
  ```

* `bluetooth`: The proper format is either `{spec: '<version>'}` with `version` being the version of the BT protocol supported, or `{spec: '<version>', profiles: '<profiles>'}` when your device
  supports additional profiles. Currently the possible values for `profiles` are `A2DP`, `A2DP + aptX` and `A2DP + aptX HD`
* `carrier`: If the device was released for a specific carrier, the name of that carrier. Otherwise, leave the line blank.
* `cpu`: The CPU type of the device - for example, `Cortex-A9` or `Krait 300`.
* `download_boot`: Instructions for booting the device into the mode used to install recovery. On most devices, this is fastboot mode.
* `image`: The image located under `images/devices/` to use for this device. Instructions on adding an image are below.
* `install_method`: Used to determine the recovery install template to use. Templates can be found in \_includes/templates/recovery\_install\_`install_method`.md.
* `kernel`: The repo name of the kernel - for example, `android_kernel_oneplus_msm8974`.
* `network`: The frequencies and channels for the various network technologies. You can look them up [here](https://www.frequencycheck.com/models/). Keep the non-available technologies empty.
* `peripherals`: A list of peripherals available on the device, including, but not limited to those from the following list:

  ```
  {{ sorted | join: ", " }}
  ```

* `release`: Allowed formats: `yyyy`, `yyyy-mm` and `yyyy-mm-dd`. In case of multiple devices with different dates, you can use Model-Value-Pairs:

  ```
  release:
  - Model1: 2015
  - Model2: 2016-01
  ```

* `tree`: The repo name of the device tree - for example, `android_device_oneplus_bacon`.
* `vendor_short`: The vendor name used for the device tree - for example, `oneplus`.

There are multiple items which either need to be filled out correctly or not be present at all:

```
custom_twrp_link
custom_twrp_codename
custom_unlock_cmd
required_bootloader
```

### Adding the device's image

Find a reasonably high-quality image of your device, and add it to `images/devices/<image>.png`. The filename should match the
entry in your YAML file.

## Testing it works

Start the wiki on your local Jekyll server, and navigate to [the devices list](http://localhost:4000/devices.html). Your device should be there.
Click on it, and check that the info/install/build pages all seem correct.

## Submitting your device

After verifying the device-specific pages, commit and upload your changes to Gerrit, and add the "Wiki Editors" group as reviewers.
