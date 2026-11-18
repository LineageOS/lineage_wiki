---
sidebar: home_sidebar
title: How to submit a bug report
folder: how-tos
redirect_from: bugreport-howto.html
permalink: /how-to/bugreport/
tags:
 - how-to
---

## What **NOT** to report
  - **DON'T**: Report bugs in unofficial builds or anything not downloaded from [our official portal](https://download.lineageos.org/) - this also includes ROMs "based on" LineageOS as well.
  - **DON'T**: Report missing builds.
  - **DON'T**: Installation help.
  - **DON'T**: Device support.
  - **DON'T**: Feature requests

## Reporting a bug

# Before you submit a bug, please verify that someone else hasn't reported it already.

**WHAT NOT TO DO:**
- **DON'T:** Post "Me too" or "+1" messages on existing reports
- **DON'T:** Comment your device as affected on a report for a different device - different devices have different maintainers, and different reasons for bugs to exist
- **DON'T:** Ask if it is fixed already - if the report is still open it probably is still present!
- **DON'T:** Ask for status updates - we can't provide them (no ["ETA"]({{ "glossary/#eta" | absolute_url }}){: .glossary}!)
- **DON'T:** Ping people/maintainers - most of them already check the tracker
- **DON'T:** Post bugs on modified devices (e.g., devices with many add-ons, or rooted devices) -  as those modifications are potentially causes for your issue
- **DON'T:** Post AI output - if we needed educated guesses, we can/will prompt the models ourselves. Other than that, it really provides no value having to filter through even more text that may be completely unhelpful
- **DON'T:** Update the post with every affected build - if the report is still open, the issue likely still exists

All bug reports are to be posted in **english only**.

### Reporting Android bugs

These are bugs in LineageOS itself, e.g.
  - The fingerprint sensor on your device doesn't work.
  - Your phone crashes when you try to enable encryption.
  - WiFi calling doesn't work.

**DON'T** use the e-mail functionality when filing a bug report. You are to use the provided template.
**Read the template carefully before filling it out** - all of the fields come with explanations and examples.

For example, when you're asked for the device codename, `Samsung Galaxy` is **not** the right choice - you can find the codename on your device's overview and wiki page.

Most of the requested information can be found on your device if you go to *Settings->About phone* and click on the `Android version` item.

Make sure to fill out the template with accurate information and in the format requested. It doesn't matter if we're asking for info that has nothing to do with your issue - if the report isn't properly filled out it will be closed.
If you fail to fill the template properly, a checker will close your report. If you **edit/rectify** the report, it'll be automatically rechecked.

  {%- capture content %}Do **not** open new reports if your current one happens to be closed - you can fail on the same report multiple times without starting a new one!{% endcapture %}
  {% include alerts/important.html content=content %}

  {%- capture content %}[Logcats]({{ "how-to/logcat/" | relative_url }}) *must* be attached for all Android bugs, and *must* be captured right after reproducing the issue. Without these, it is much more difficult and time-consuming for us to resolve the issue.{% endcapture %}
  {% include alerts/warning.html content=content %}

{% include alerts/important.html content="Every single issue *must* be submitted in a separate report. Combining bugs can delay resolution, especially if they're device-specific or handled by different maintainers." %}

<a href="https://github.com/LineageOS/issues/issues"><button class="btn btn-primary">Go to Android bugs</button></a>

### Reporting Infrastructure bugs

These are bugs in our online services, e.g.
  - The documentation on wiki is wrong.
  - The download portal doesn't render something correctly.
  - There's a dead link on the website.
  - An API returns something unexpected.

  {% include alerts/important.html content="If the issue affects your device, this is the **wrong** place to report your issue!" %}

<a href="https://github.com/LineageOS/issues-infra/issues"><button class="btn btn-primary">Go to infrastructure bugs</button></a>
