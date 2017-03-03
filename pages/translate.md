---
sidebar: home_sidebar
title: How to translate
permalink: translate-howto.html
tags: how-to, translate, crowdin
---

## How to translate

We use [Crowdin](http://translate.lineageos.org/) as our translation system. To contribute with translations, create an account there, click the desired language and apply as translator. Once you were accepted, you can click through the various files and suggest translations.

## I have translated a lot, how do I get these to my device now?

There is (or should be) at least one proofreader for each language (you can apply, if not). Those will (also on a voluntary basis) look through the strings and validate those which they think are fitting the context and are of a high-enough quality. In case you note that your strings don't go in for some time (and no alternate suggestion as well), you can contact one of the proofreaders via the sidebar on the right. To do so, simply type "@" followed by the name and then add the message (e.g. "@NameHere: Please look through my translations on this file").
After the strings have been validated, an irregular job is run (by one of the [Managers](http://wiki.lineageos.org/contributors.html#translations-managers) to copy the strings over to [Gerrit](https://review.lineageos.org). After a successful build they get merged and will be part of every new build.

{% include tip.html content="You can check who is proofreader for your language on the [Contributors](http://wiki.lineageos.org/contributors.html#translations-proofreaders) page." %}

## Correct wrong strings

### Translated strings

Sometimes you will notice translated strings which seem to be slightly different from what you'd expect or simply wrong. There are various reasons to how this can happen, but still, the only relevant thing is how to improve the translation. Just suggest your translation like you would do for any untranslated string. After saving it you will have the possibility to "Notify the proofreader".

{% include note.html content="If you feel like the proofreader (who is a volunteer as well) is not doing a good job or isn't active anymore, feel free to send him a message or notify one of the [Managers](http://wiki.lineageos.org/contributors.html#translations-managers) about it." %}


### Original strings

There is no guarantee the original strings you want to translate are perfect. If you notice an issue there, use the side bar and mark the field "issue", then type some info on what you think is wrong. If the mistake is only minor, correct this error in your translation, and submit it.
