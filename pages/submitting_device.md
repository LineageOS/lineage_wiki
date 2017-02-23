---
title: Submitting a Port
permalink: submitting_device.html
---
Congratulations! You've got your device, you've spent weeks (months?) getting it to work.
Now you want to submit your device tree and kernel back upstream to be recognized by LineageOS
as an "official" device. Here's what you need to do...

## Prerequisites

Make sure you've met the following requirements

* **Full hardware support** - Everything that is support by stock _must_ be supported in LineageOS.
    {% include note.html content="We are willing to make exceptions to this rule, however, any exceptions will be per device, and issues must be detailed in full." %}
* **Stability** - Nothing should crash. LineageOS has a reputation for stability and your port must be rock-solid. This means no "sleep of deaths", either.
* **No overclocking/overvolting** - Don't increase clocks/voltages beyond the manufacturer's defaults.
* **Enforcing SELinux** - The device must work while SELinux is enforcing (which is the default).
* **No non-PIE blobs** - If your device requires blobs which aren't position-independent, it will not be accepted.


## Submitting your device

* Send an email to devrel@lineageos.org. The email must contain:
    * Links to your device, vendor, and kernel trees on Github.
    * Email addresses for all maintainers, along with either IRC nicknames or Hangouts addresses
    * If a team worked on your device, all team members must be listed in the email.

Once you've sent your email, expect a good amount of time to pass before reply. This can take a couple of weeks.
Your device will be reviewed. If things need to be changed, a conversation will start to help guide you through the
process of being accepted. If your device is rejected, you will get a detailed response as to why.
Not all devices will be accepted. Keep this in mind.
