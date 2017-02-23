---
title: Submitting a Port
permalink: submitting_device.html
---
Congratulations! After weeks (months?) of hard work, LineageOS is running well on your device! 
If you're interested in adding your device to LineageOS' roster of officially supported devices, we
ask that you meet some important prerequisites and then get in touch with developer relations.

## Prerequisites

Make sure your device meets the following requirements:

* **Full hardware support** - Everything that is supported by stock _must_ be supported in LineageOS.
    {% include note.html content="We are willing to make exceptions to this rule, however, any exceptions will be per device, and issues must be detailed in full." %}
* **Stability** - Nothing should crash. LineageOS has a reputation for stability and your port must be rock-solid.
* **No overclocking/overvolting** - Don't alter clocks/voltages outside of the manufacturer's default ranges.
* **Enforcing SELinux** - The device must work while SELinux is enforcing (which is the default).
* **No non-PIE blobs** - If your device requires executables which aren't position-independent, it will not be accepted.

Additional considerations:

* **Continued support** - LineageOS is not a "submit it and forget it" home. You need to be willing
to continue maintenance of the device (bugfixes, security updates, and performance improvements).

## Submitting your device

Send an email to <devrel@lineageos.org>. The email should contain:

* Links to your device, vendor, and kernel trees on GitHub.
* Email addresses of all maintainers, along with either Freenode IRC nicknames or Hangouts addresses.
If a team worked on your device, all team members must be listed in the email.

Please be patient once you've sent your email. It takes time to review your source code and vendor blobs.
If changes are deemed necessary, you'll receive notice and suggestions for improvement. It will be up
to you to implement the changes before resubmitting your work for approval. Keep in mind that not all
device port requests are accepted. Developer relations will do their best to inform you of the rationale for their decision, though.