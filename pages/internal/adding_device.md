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

The sample template has been copied to `$LINEAGE_SRC/lineage/wiki/_data/devices/your_device.yml`.
Update the values to match your device. An explanation of some of the options is below:

{% assign definitions = site.data.schema.definitions %}
{% assign properties = site.data.schema.properties %}

* `architecture`: The CPU architecture of the device, can be one of

  ```
  {{ definitions.valid_architectures.enum | join: ', ' }}
  ```

  If your device has a 64 bit architecture but Android runs on 32 bit, you can use a different format: `{cpu: 'arm64', userspace: 'arm'}`

* `battery`: Use the format `{removable: False, capacity: <number in mAh>, tech: '<tech>'}`. If your battery is removable, use `True` instead.
For `tech` you can use:

  ```
  {{ definitions.battery_data.properties.tech.enum | join: ', ' }}
  ```

  For devices with any kind of fast-charging, you can add `fastcharge: True` to the line.
  In case you are setting up one file for multiple devices which have different batteries, you can use Model-Value-Pairs, e.g.

  ```
  battery:
  - Model1: {removable: False, capacity: 1000, tech: 'Li-Ion'}
  - Model2: {removable: True, capacity: 2000, tech: 'Li-Po', fastcharge: True}
  ```

* `bluetooth`: The proper format is either `{spec: '<version>'}` with `version` being the version of the BT protocol supported, or `{spec: '<version>', profiles: '<profiles>'}` when your device
  supports additional profiles. These are the possible values:

  ```
  For the specification:
  {{ properties.bluetooth.properties.spec.enum | join: ', ' }}

  For the optional profiles:
  {{ properties.bluetooth.properties.profiles.items.enum | join: ', ' }}
  ```

* `carrier`: If the device was released for a specific carrier, the name of that carrier. Otherwise, leave the line blank.
* `cpu`: The CPU type of the device, can be one of the following list:

  ```
  {{ properties.cpu.enum | join: ", " }}
  ```


* `download_boot`: Instructions for booting the device into the mode used to install recovery. On most devices, this is fastboot mode.
* `image`: The image located under `images/devices/` to use for this device. Instructions on adding an image are below.
* `install_method`: Used to determine the recovery install template to use. Templates can be found in \_includes/templates/recovery\_install\_`install_method`.md.
* `kernel`: The repo name of the kernel - for example, `android_kernel_oneplus_msm8974`.
* `network`: The frequencies and channels for the various network technologies. You can look them up [here](https://www.frequencycheck.com/models/). Keep the non-available technologies empty.
* `peripherals`: A list of peripherals available on the device, can be any of the following list:

  ```
  {{ definitions.valid_peripherals.items.enum | join: ", " }}
  ```

* `release`: Allowed formats are `yyyy`, `yyyy-mm` and `yyyy-mm-dd`. In case of multiple devices with different dates, you can use Model-Value-Pairs:

  ```
  release:
  - Model1: 2015
  - Model2: 2016-01
  - Model3: 2016-02-01
  ```

* `tree`: The repo name of the device tree - for example, `android_device_oneplus_bacon`.
* `vendor_short`: The vendor name used for the device tree - for example, `oneplus`.


Additionally there are some optional properties which you might not need, but in case you do, they are documented below:

* `custom_twrp_link`: A custom TWRP link in case the official recovery doesn't exist for the specific device or doesn't work properly. Remove this if not used!
* `custom_twrp_codename`: If an official TWRP exists for the device, but TWRP uses a different codename, specify the used one here. Remove this if not used!
* `custom_unlock_cmd`: Used if the command to unlock your device via fastboot is different than `fastboot oem unlock`. Remove this if not used!
* `is_ab_device`: Used if device supports A/B partitions to flash custom recovery. Remove this if not used!
* `required_bootloader`: Specify the bootloader versions which are required to install LineageOS. If no special requirement exists, remove this line! Example:

  ```
  required_bootloader: [Version1, Version2]
  ```


{% include note.html content="If you need to assign a value to one of the fields which is not allowed by the time you create your change, update the schema validator or contact us to add it" %}

### Adding the device's image

Find a reasonably high-quality image of your device, and add it to `images/devices/<image>.png`. The filename must match the
entry in your YAML file. Also make sure the background of the image is transparent.

## Testing it works

Start the wiki on your local Jekyll server, and navigate to [the devices list](http://localhost:4000/devices.html). Your device should be there.
Click on it, and check that the info/install/build pages all seem correct.

Now run the validation:

```
bundle install
ruby ./test/validate.rb
```

If the script doesn't give you an output, all the validated fields have a proper format. Otherwise, read the messages carefully to see which fields have to be corrected.

## Submitting your device

After verifying the device-specific pages, commit and upload your changes to Gerrit, and add the "Wiki Editors" group as reviewers.
