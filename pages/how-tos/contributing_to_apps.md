---
sidebar: home_sidebar
title: How to contribute to individual apps
folder: how-tos
redirect_from: contributing-apps.html
permalink: /how-to/contributing-apps/
tags:
 - how-to
---

If you would like to contribute to LineageOS, but are unable to set up a development environment, one option is contributing to individual Lineage apps. While these are not the main focus of the project, they are very important, and can always use contributors.

## Which apps?

The following apps can be built with Gradle, separately from the main codebase.

| App             | Description        | Gerrit                                                                                   | GitHub                                                             |
|-----------------|--------------------|------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Messaging       | SMS/MMS Messaging  | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Messaging)       | [GitHub](https://github.com/LineageOS/android_packages_apps_Messaging)       |
| Glimpse         | Gallery            | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Glimpse)         | [GitHub](https://github.com/LineageOS/android_packages_apps_Glimpse)         |
| Aperture        | Camera             | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Aperture)        | [GitHub](https://github.com/LineageOS/android_packages_apps_Aperture)        |
| Camelot         | PDF Viewer         | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Camelot)         | [GitHub](https://github.com/LineageOS/android_packages_apps_Camelot)         |
| Etar            | Calendar           | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Etar)            | [GitHub](https://github.com/LineageOS/android_packages_apps_Etar)            |
| ExactCalculator | Calculator         | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_ExactCalculator) | [GitHub](https://github.com/LineageOS/android_packages_apps_ExactCalculator) |
| Twelve          | Music Player       | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Twelve)          | [GitHub](https://github.com/LineageOS/android_packages_apps_Twelve)          |
| Jelly           | Browser            | [Gerrit](https://review.lineageos.org/admin/repos/LineageOS/android_packages_apps_Jelly)           | [GitHub](https://github.com/LineageOS/android_packages_apps_Jelly)           |
{: .table }

## How can I contribute?

### Setting up Git

In order to contribute, you will need to install Git on your computer.

{% include templates/git_setup.md %}

### Cloning the source code

To begin, navigate to the Gerrit page of the app you would like to work on. From there, clone the source code and the commit hooks, by using the following git command:

```
git clone "https://github.com/LineageOS/android_packages_apps_<app-name>" && (cd "android_packages_apps_<app-name>" && mkdir -p `git rev-parse --git-dir`/hooks/ && curl -Lo `git rev-parse --git-dir`/hooks/commit-msg https://review.lineageos.org/tools/hooks/commit-msg && chmod +x `git rev-parse --git-dir`/hooks/commit-msg)
```

Once you have cloned the source code, import the app into Android Studio. 

Now you can make your changes, and then save the file. You will be able to build these apps with gradle, and install them in a development device or on an emulator.

### Uploading your changes

Once you are satisfied with your changes, navigate to the folder of your app in the terminal and run: 

```
git add .
git commit
```

An editor will pop up. In the first line, type a short (below 50 character) description of your changes,
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

{% include templates/git_resources.md %}
