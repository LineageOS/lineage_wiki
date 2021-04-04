---
sidebar: home_sidebar
title: How to translate
folder: how-tos
redirect_from: translate-howto.html
permalink: /how-to/translate
tags:
 - how-to
---

## How to translate

We use [Crowdin](https://crowdin.com/projects/LineageOS) as our translation system. To submit translations, create an [account](https://crowdin.com/join), click the desired language and apply as translator. Once you are accepted, you can click through the various files and suggest translations.

A general rule of thumb is: `Quality, not quantity`! If you are unsure about the context of a string or about what it could mean, leave it untouched. It's much better to have the correct English string there instead of having a wrong translation which doesn't make sense to the user.

### Difference between LineageOS and LineageOS AOSP

On [Crowdin](https://crowdin.com/projects/LineageOS) you will notice two different projects:

 - The ``LineageOS`` project contains translations for LineageOS' additional features and applications for languages supported by AOSP.
 - The ``LineageOS AOSP`` project is for languages not part of the upstream Android sources. It contains the strings for LineageOS' features and additions but will also allow for translation of the rest of the OS.

### My language is not there and I have checked several times

You seem to speak a language which nobody else does... or there has just been the lack of someone willing to provide support. Contact one of the managers so we can support you by adding your language as well.

## I have translated a lot, how do I get these to my device now?

There is (or should be) at least one proofreader for each language (you can apply, if not). Proofreaders will look through the strings and validate those which they think are fitting the context and are of a high-enough quality. In the event that you do not see an active review or acceptance of your (or alternative) suggestions, you can contact one of the proofreaders via the sidebar on the right. To do so, simply type "@" followed by the name and then add the message (e.g. "@NameHere: Please look through my translations on this file").  
After the strings have been validated, a scripted job is run (by one of the [Managers]({{ "contributors.html#translations-managers" | relative_url }})) to import the strings to [Gerrit](https://review.lineageos.org). After a successful test build they get merged into the source code and will be part of every new official build.

{% capture content %}You can check who the proofreader is for your language on the [Contributors]({{ "contributors.html#translations-proofreaders" | relative_url }}) page.{% endcapture %}
{% include alerts/tip.html content=content %}

## Correcting wrong strings

### Translated strings

Sometimes you will notice translated strings which seem to be slightly different from what you'd expect or simply wrong. There are various reasons to how this can happen, but still, the only relevant thing is how to improve the translation. Just suggest your translation like you would do for any untranslated string. After saving it you will have the possibility to "Notify the proofreader".

{% capture content %}If you feel like the proofreader (who is a volunteer as well) is not doing a good job or isn't active anymore, feel free to send him a message or notify one of the [Managers]({{ "contributors.html#translations-managers" | relative_url }}) about it.{% endcapture %}
{% include alerts/note.html content=content %}

### Original strings

There is no guarantee the original strings you want to translate are perfect. If you notice an issue there, use the side bar and mark the field "issue", then type some info on what you think is wrong. If the mistake is only minor, correct this error in your translation, and submit it.

## What not to translate

Having the source code and crowdin strings in sync is not an easy job and stuff can slip through.
Generally you need to pay attention to a few things:

1. Strings starting with `@` (very often used in strings like `@string/<something>`) - these are marked as translatable when they shouldn't be. Please use the `issue` checkbox on the right of the screen to notify us.
2. Strings with `xliff` tags, e.g. `<xliff:g id="name" example="Help improve LineageOS">%1$s</xliff:g>`: Keep the whole thing untouched and embed it into your translation at an appropriate place.
   The example is just there to tell you what can be inserted instead of %1$s in the OS so you know where to place it in your translation. There is no need to touch this either.

## Proofreading

Every string requires to be validated by a proofreader. In case your language doesn't have an active proofreader, you can apply for it.
As a proofreader, you also have to make sure that the submitted strings match the context.

{% include alerts/note.html content="You need to be an active translator for at least one month in order to apply as a proofreader!" %}

Besides the responsibility to only approve strings appropriate for use in the system and to make sure to avoid approving strings mentioned in [What not to translate](#what-not-to-translate), there are other things to pay attention to:

### Quantity and product strings

Various strings exist multiple times for different products (mostly `tablet`, `phone`, `device` or `other`) and quantities (`one`, `two`, `many`, `few`, `other`).
Once a string for one of them is translated and approved, the Android build system (specifically `aapt2` for resource builds) requires the whole chain to be present.
As a proofreader you have to make sure to approve all variants of a string.
