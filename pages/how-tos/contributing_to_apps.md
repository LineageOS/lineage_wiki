---
sidebar: home_sidebar
title: How to contribute to individual apps
folder: how-tos
permalink: /how-to/contributing-apps/
tags:
 - how-to
---

If you would like to contribute to LineageOS, but are unable to set up a development environment, another option is contributing to our individual applications. While these are not the main focus of the project, they are very important, and can always use contributors.

## Which apps?

The following apps can be built with Gradle seperate from the main codebase.

{%- capture content %}If an app is not listed here, it can't be built with Gradle, and will need to be built with the entire codebase as described in the build section of [your device]({{ "devices/" | relative_url }}).{% endcapture %}
{% include alerts/note.html content=content %}

| App             | Description        | Gerrit                                                                                   | GitHub                                                             |
|-----------------|--------------------|------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Aperture        | Camera             | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Aperture)        | [GitHub](https://github.com/LineageOS/android_packages_apps_Aperture)         |
| Camelot         | PDF Viewer         | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Camelot)         | [GitHub](https://github.com/LineageOS/android_packages_apps_Camelot)          |
| ExactCalculator | Calculator         | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_ExactCalculator) | [GitHub](https://github.com/LineageOS/android_packages_apps_ExactCalculator)  |
| Glimpse         | Gallery            | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Glimpse)         | [GitHub](https://github.com/LineageOS/android_packages_apps_Glimpse)          |
| Jelly           | Browser            | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Jelly)           | [GitHub](https://github.com/LineageOS/android_packages_apps_Jelly)            |
| LatinIME        | Keyboard           | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_inputmethods_LatinIME)| [Github](https://github.com/LineageOS/android_packages_inputmethods_LatinIME) |
| Recorder        | Audio Recorder     | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Recorder)        | [GitHub](https://github.com/LineageOS/android_packages_apps_Recorder)         |
| Twelve          | Music Player       | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Twelve)          | [GitHub](https://github.com/LineageOS/android_packages_apps_Twelve)           |
| Etar            | Calendar           | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Etar)            | [GitHub-Upstream](https://github.com/Etar-Group/Etar-Calendar)                |
{: .table }

{%- capture content %}Etar (our calender app) is pulled from the [upstream project](https://github.com/Etar-Group/Etar-Calendar), so most contributions should be made via pull request at their repository. If your change is specific to Lineage's fork, then you can submit it to [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Etar).{% endcapture %}
{% include alerts/warning.html content=content %}

## How can I contribute?

### Setting up Git

In order to contribute, you will need to install Git on your computer.

{% include templates/git_setup.md %}

### Cloning the source code

To begin, navigate to the Gerrit page of the app you would like to work on. From there, clone the source code and the commit hooks, by using the following git command:

```
git clone "https://github.com/LineageOS/android_packages_apps_<app-name>" && (cd "android_packages_apps_<app-name>" && mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://review.lineageos.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg)
```

### Importing into Android Studio

Once you have cloned the source code, you can import the app into Android Studio.

First make sure you have the latest version of Android Studio installed. It is available [here](https://developer.android.com/studio), or as a [flatpak](https://flathub.org/apps/com.google.AndroidStudio), if you prefer.

Once it is downloaded, you can import the project, make your changes, and then save the file. You will be able to build these apps with Gradle, and install them on a device or emulator.

{%- capture content %}If you are looking for things to work on, check out the list of [platform issues](https://gitlab.com/LineageOS/issues/android/-/issues/?sort=created_date&state=opened&label_name%5B%5D=platform), and look for an issue related to one of the apps listed here.{% endcapture %}
{% include alerts/tip.html content=content %}

### Uploading your changes

Once you are satisfied with your changes, navigate to the folder of your app in the terminal and run:

```
git add .
git commit
```

An editor will pop up. In the first line, type a short (less than 50 characters) description of your changes,
then put a blank line, and, if you want, a more detailed description of your changes. Make sure to preface the title of the commit with the app you are working on.

LineageOS uses [Gerrit](https://review.lineageos.org/) to review proposed changes. Before you begin,
you'll need to [create an account](https://review.lineageos.org/login/%23%2Fregister%2Fq%2Fstatus%3Aopen),
and [configure an SSH key](https://review.lineageos.org/Documentation/user-upload.html#ssh).

After you've done this, you can push your commits to Gerrit:

```
git remote add gerrit ssh://<gerritusername>@review.lineageos.org:29418/LineageOS/android_packages_apps_<app-name>
git push gerrit HEAD:refs/for/main
```
{% include alerts/tip.html content="On push to Gerrit, a bot will automatically build the app with your latest changes, and will leave a review if the build succeeds. Also, you can visit the link in the review to download an apk of your change." %}

### Getting your submission reviewed/merged

All submitted patches go through a code review process prior to being merged. In addition to peer reviews, certain project members have the capability to merge your changes into LineageOS.
To make sure they get informed:

1) Add the "PROJECT-Lineage-apps" group as reviwers. (Click on the little person to the right of "reviewers".)

2) Set the [proper labels]({{ "how-to/using-gerrit#reviewing-a-patch" | relative_url }}) to indicate your patch is ready.

### Editing your submission

If the reviewers point out anything that needs to be fixed, have no fear. You can make the changes, and then run:

```
git add .
git commit --amend
```

Your commit message should show up in an editor. You can edit it, or just quit the editor. You can then run `git push gerrit HEAD:refs/for/main` to upload your changes to Gerrit.

Eventually, when your change looks _perfect_, someone will approve and merge it. Awesome!

## Tips

### Modifying strings

When contributing to these apps, keep in mind that modifiying strings differs from normal Android app development.

#### Adding strings

When an app is imported from AOSP to Lineage, we generally keep the strings separate by adding a string file with the name of either `cm_strings` or `lineage_strings`. This is so that we can translate them and keep track of our own strings verus upstream. When editing an app's strings check to see if the app has one of these files. If it does then **all** new strings should be added there otherwise you can simply add strings to the regular `strings.xml` file.

#### Editing strings

When editing current strings, be sure to only edit the main strings file in `values/strings`. There is no need to update, add or delete any of the translations, even if you only changed the string name. All of this is taken care of by our translation import.

### gradle-generatebp

LineageOS apps use the [gradle-generatebp](https://github.com/lineage-next/gradle-generatebp) tool. This Gradle plugin automatically generates .bp files (Android Blueprint build files) for imported libraries, allowing developers to choose which dependencies to use from AOSP and which to include as prebuilts.

#### Usage

`./gradlew generateBp` should be executed from the app directory whenever you:

- Update existing dependencies
- Add new dependencies
- Make changes that affect the build configuration

The configuration, defined in app/build.gradle.kts, specifies which dependencies are available in AOSP and which should be treated as prebuilts:

```
configure<GenerateBpPluginExtension> {
    targetSdk.set(android.defaultConfig.targetSdk!!)
    minSdk.set(android.defaultConfig.minSdk!!)
    availableInAOSP.set { module: Module ->
        when {
            module.group.startsWith("androidx") -> {
                // We provide our own androidx.pdf
                !module.group.startsWith("androidx.pdf")
            }
            else -> false
        }
    }
}
```

This specific configuration would make all modules from the androidx group available in AOSP, except the androidx.pdf group, for which the tool will now import the prebuilt AAR/JARs and create the corresponding .bp rules.

{% include alerts/note.html content="Prebuilt dependencies should be kept to a minimum. Always prefer using dependencies available in AOSP when feasible." %}

The tool is integrated into the CI system to ensure there's no mismatch between Gradle dependencies and AOSP dependencies.

{% include templates/git_resources.md %}
