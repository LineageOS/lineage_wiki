---
title: Submitting a port
permalink: submitting_device.html
---
Congratulations! After weeks (months?) of hard work, LineageOS is running well on your device!
If you're interested in adding your device to LineageOS' roster of officially supported devices, we
ask that you meet some important prerequisites and then get in touch with our developer relations team.

## Prerequisites

### Device

**Your device MUST meet the requirements of our charter** - Presented in [device support requirements](https://github.com/LineageOS/charter/blob/master/device-support-requirements.md).

{% include alerts/note.html content="We are willing to make exceptions to _some_ of these rules, however, any exceptions will be per device, and issues must be detailed in full. See charter's entry on [Attaining exceptions](https://github.com/LineageOS/charter/blob/master/device-support-requirements.md#attaining-exceptions) for more details." %}

### Maintainer

Make sure **you** meet the following requirements:

* **Continued support** - Ask yourself: *"Do I want to provide continuous support?"* - LineageOS is *not* a "submit it and forget it" home.
You need to be willing to continue maintaining the device by fixing bugs, applying security updates and eventually improving performance.

## Submitting your device

Send an email to <devrel@lineageos.org>. The email should contain:

* Links to your device, vendor, and kernel trees on GitHub.
* Email addresses of all maintainers.
If a team worked on your device, all team members must be listed in the email.

Please be patient once you've sent your email. It takes time to review your source code and vendor blobs.
If changes are deemed necessary, you'll receive notice and suggestions for improvement. It will be up
to you to implement the changes before resubmitting your work for approval. Keep in mind that not all
device port requests are accepted. Developer relations will do their best to inform you of the rationale for their decision, though.

## Making your device official

{% include alerts/note.html content="Once you have successfully submitted your device, you will be given access to our internal tools to help maintain your device and coordinate development of LineageOS. You only need to worry about these steps once you've been given access to them." %}

The following steps are necessary to finally make your device an official one:

* Prepare all the info: [Add your device to the wiki]({{ "addingdevice-howto.html" | relative_url }}).
* Make it build: Create a patch for the `hudson` project on our GitHub org and add your device to the `lineage_build_targets` file.
