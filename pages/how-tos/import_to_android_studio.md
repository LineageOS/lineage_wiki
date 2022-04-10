---
sidebar: home_sidebar
title: How to import the sources to Android Studio / IntelliJ
folder: how-tos
redirect_from: import-android-studio-howto.html
permalink: /how-to/import-to-android-studio
tags:
 - how-to
---

## Install Android Studio

Go to the [Download page](https://developer.android.com/studio/index.html#downloads) and download the package for your OS.

Unpack the downloaded file to a destination of your choice, then follow the instructions described in `Install-Linux-tar.txt` file which is in the extracted folder.


## Prepare a project file

Open a shell and navigate to the root folder of your Android sources, e.g. `~/android/lineage`.
In case environment functions and variables are not yet loaded, type:

```
source build/envsetup.sh
```

{% include alerts/tip.html content="You can always check this by executing `croot` (go to your Android root dir) and see if it gives an error. If not, you have already executed the `source` command." %}

Now execute:

```
make idegen && development/tools/idegen/idegen.sh
```

{% include alerts/note.html content="This can take some time while it goes through your tree and generates an Android Studio project based on it." %}

In case you are developing on multiple branches or plan to do so (otherwise skip the next step), do the following (replace every occurrence of `lineage` with your desired naming scheme):

```
mv android.ipr lineage.ipr
mv android.iml lineage.iml && ln -s lineage.iml android.iml
```

## Prepare Android Studio

Android Studio struggles to parse the huge LineageOS / Android sources and requires some different settings than the defaults. Therefore, before starting actual development, it is necessary to change some of those.

### Configure memory

Open Android Studio and click on **Configure**.

Then click on "Edit Custom VM Options" and include the following:

```
-Xms748m
-Xmx748m
```

This will set the initial allocated (`Xms` parameter) and maximum usable (`Xmx` parameter) RAM to 748MB each. You can also use higher numbers but should not go below that to ensure usability. You can find more information of [these](https://developer.android.com/studio/intro/studio-config.html#adjusting_heap_size) and other parameters in the [official documentation](https://developer.android.com/studio/intro/studio-config.html)

### Increase the file parsing limit

Again, click on **Configure** and then click on "Edit Custom Properties" and put `idea.max.intellisense.filesize=5000` there (you can change its value to something higher than 5000, if you wish)

This is required so Android Studio can parse very large files to properly provide the auto-complete features (Android Studio calls this `IntelliSense`).

{% include alerts/note.html content="If the line is missing (it should already be inside the file with current Android Studio versions), append it to the end of the file." %}

## Start working with Android Studio

Reopen Android Studio and click on **Open existing project**.

Then navigate to your Android source directory and open the `.ipr` file.

{% include alerts/note.html content="Opening the project the first time or after a fresh sync can take a while. You should wait until any indexing of files is done to be sure that every IDE feature is ready to use." %}

### Configure the project

After opening the project, navigate to **File -> Project Structure -> SDKs** (this might be disabled until the indexing has finished) and set up a JDK (version 1.8 for LineageOS 14.1 branch) where you remove _all_ libraries (`.jar` files).

Then, on the left side of the settings panel, choose **Project Settings -> Modules** and mark the folder `out/target/common/R` as `Sources` (you can also select it and press [ALT]+[S]).

Press **Apply** and close the settings.

### Start developing

Now, after all the previous steps are done, you can actually start developing and exploring the sources. The `Find in path` function (**Edit -> Find -> Find in path**) can be a good start to find a file you want to modify. Just search for a known string among all source files and then dive in deeper until you actually found the function you want to modify.

### Contribute!

After you have modified the sources and tested your change, you can contribute to LineageOS by [submitting your work]({{ "/how-to/submitting-patches" | relative_url }}).

