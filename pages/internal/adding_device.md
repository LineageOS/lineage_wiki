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

See [contributing using repo](contributing_using_repo.html) for detailed instructions on setting up the wiki locally.

## Adding your device

### Populating the YAML

{% assign devices = "" | split: " " %}
{% for device in site.data.devices %}
{% assign devices = devices | push: device[1] %}
{% endfor %}

{% assign all = " " | split: " " %}
{% for device in devices %}
{% for peripheral in device.peripherals %}
{% unless peripheral == "" or peripheral contains "not supported" %}
{% assign all = all | push: peripheral %}
{% endunless %}
{% endfor %}
{% endfor %}
{% assign sorted = all | uniq | sort %}

You can use the [sample template](https://github.com/LineageOS/lineage_wiki/blob/master/device_sample/sample.yml) as a starting point, and
update the values to match your device. An explanation of poorly-named/confusing options is below:

* `architecture`: The CPU architecture of the device - for example, `arm` or `arm64`.
* `carrier`: If the device was released for a specific carrier, the name of that carrier. Otherwise, leave the line blank.
* `cpu`: The CPU type of the device - for example, `Cortex A9` or `Krait 300`.
* `download_boot`: Instructions for booting the device into the mode used to install recovery. On most devices, this is fastboot mode.
* `image`: The image located under `images/devices/` to use for this device. Instructions on adding an image are below.
* `install_method`: Used to determine the recovery install template to use. Templates can be found in \_includes/templates/recovery\_install\_`install_method`.md.
* `kernel`: The repo name of the kernel - for example, `android_kernel_oneplus_msm8974`.
* `network`: The frequencies and channels for the various network technologies. You can look them up [here](https://www.frequencycheck.com/models/). Keep the non-available technologies empty.
* `peripherals`: A list of peripherals available on the device, including, but not limited to those from the following list:

  ```
  {{ sorted | join: ", " }}
  ```

* `tree`: The repo name of the device tree - for example, `android_device_oneplus_bacon`.
* `vendor_short`: The vendor name used for the device tree - for example, `oneplus`.

### Adding the device's image

Find a reasonably high-quality image of your device, and add it to `images/devices/<image>.png`. The filename should match the
entry in your YAML file.

### Adding device-specific pages

Copy each of the sample Markdown files found [here](https://github.com/LineageOS/lineage_wiki/tree/master/device_sample), replacing `sample` with your
device's codename. Each of these files should go in `pages/<build|info|install>/<codename>.md`.

## Testing it works

Start the wiki on your local Jekyll server, and navigate to [the devices list](http://localhost:4000/devices.html). Your device should be there.
Click on it, and check that the info/install/build pages all seem correct.

## Submitting your device

After verifying the device-specific pages, commit and upload your changes to Gerrit, and add the "Wiki Editors" group as reviewers.
