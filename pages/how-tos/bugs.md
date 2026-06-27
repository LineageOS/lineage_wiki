---
sidebar: home_sidebar
title: How to submit a bug report
folder: how-tos
redirect_from: bugreport-howto.html
permalink: /how-to/bugreport/
tags:
 - how-to
---

## What not to report
  - Bugs in unofficial builds or anything not downloaded from [our official portal](https://download.lineageos.org/) - this includes other ROMs "based on" LineageOS as well!
  - Missing builds
  - Asking for installation help
  - Asking for device support
  - Feature requests

## Reporting a bug

Before you submit a bug, please search to verify that someone else hasn't reported it already.

Please do not:
- Post "Me too" or "+1" messages on existing reports
- Comment your device as affected on a report for a different device - different devices have different maintainers, and different reasons for bugs to exist
- Ask if it is fixed already - if the report is still open it probably is still present!
- Ask for status updates - we can't provide them (no ["ETA"]({{ "glossary/#eta" | absolute_url }}){: .glossary}!)
- Ping people/maintainers - most of them already check the tracker
- Post bugs on modified devices (e.g., devices with many add-ons, or rooted devices) -  as those modifications are potentially causes for your issue
- Post AI output - if we needed educated guesses, we can/will prompt the models ourselves. Other than that, it really provides no value having to filter through even more text that may be completely unhelpful
- Update the post with every affected build - if the report is still open, the issue likely still exists

All bugreports have to be posted in **english only**. Please also skip reporting in your native language in addition to english - plain, simple english only is enough!

We accept bugs on the following:

### Android bugs

These are bugs in LineageOS itself, e.g.
  - The fingerprint sensor on your device doesn't work.
  - Your phone crashes when you try to enable encryption.
  - WiFi calling doesn't work.

When adding a bug report, please do **not** use the email functionality, since we provide a template that needs to be filled out properly.

Please read the template carefully before filling it - all of the fields come with explanations and examples.
For example when asked for the codename, `Samsung Galaxy` is obviously **not** the right choice - you can find the codename on your device's wiki page and the overview!

Most of the requested information can be found on your device if you go to *Settings->About phone* and click on the `Android version` item.

Make sure to fill out the template with accurate information, and in the format requested. It doesn't matter if your baseband version has nothing to do with a lock screen animation issue, if it is not there your bug will be closed.
If you fail to fill the template properly, a checker will close your report. After you **edit** the report, it'll be automatically rechecked.

  {%- capture content %}Please do **not** open new reports until you succeed - you can fail on the same report multiple times without starting a new one!{% endcapture %}
  {% include alerts/important.html content=content %}

  {%- capture content %}[Logcats]({{ "how-to/logcat/" | relative_url }}) *must* be attached for all Android bugs, and *must* be captured right after reproducing the issue. Without these, it is much more difficult and time-consuming for us to resolve the issue.{% endcapture %}
  {% include alerts/warning.html content=content %}

{% include alerts/important.html content="Please submit each issue in a separate report. Some bugs may be device-specific or handled by different maintainers, and combining them can delay resolution." %}

<a href="https://github.com/LineageOS/issues/issues"><button class="btn btn-primary">Go to Android bugs</button></a>

### Infrastructure bugs

These are bugs in our online services, e.g.
  - The documentation on wiki is wrong.
  - The download portal doesn't render something correctly.
  - There's a dead link on the website.
  - An API returns something unexpected.

  {% include alerts/important.html content="If the issue affects your device, this is the **wrong** place to report your issue!" %}

<a href="https://github.com/LineageOS/issues-infra/issues"><button class="btn btn-primary">Go to infrastructure bugs</button></a>
