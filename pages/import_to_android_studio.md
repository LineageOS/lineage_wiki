---
sidebar: home_sidebar
title: How to import the sources to Android Studio / IntelliJ
permalink: import-android-studio-howto.html
tags: how-to
---

## Install Android Studio

Go to the [Download page](https://developer.android.com/studio/index.html#downloads) and download the package for your OS.

### On Windows

Execute the downloaded installer package and follow the setup until everything is installed.

### On Linux (e.g. Ubuntu)

Unpack the downloaded file to a destination of your choice. Follow the instructions described in `Install-Linux-tar.txt` file which is in the extracted folder.


## Prepare a project file

Open a shell and navigate to the root folder of your Android sources, e.g. `~/android/system` if you followed the "build for yourdevice" guide.
In case environment functions and variables are not yet loaded, type:
```
source build/envsetup.sh
```

{% include tip.html content="You can always check this by executing `croot` (go to your Android root dir) and see if it gives an error. If not, you have already executed the `source` command." %}

Now execute:
```
make idegen && development/tools/idegen/idegen.sh
```

{% include note.html content="This can take some time while it goes through your tree and generates an Android Studio project based on it." %}

In case you are developing on multiple branches or plan to so (otherwise skip the next step), do the following:
```
mv android.ipr lineage.ipr
mv android.iml lineage.iml && ln -s lineage.iml android.iml
```

## Prepare Android Studio

Android Studio and the parsing of the huge tree of LineageOS / Android requires some different settings than the defaults. Therefore, before starting the actual development, it is necessary to set some values.

### Configure memory

Navigate to the `bin` folder from the install directory of Android Studio (e.g. `~/android-studio/bin`), open the files `studio.vmoptions` and `studio64.vmoptions` with a text editor and include the following:
```
-Xms748m
-Xmx748m
```

### Increase the file parsing limit

Again, navigate to the `bin` folder and open the file `idea.properties`. Look for the line `idea.max.intellisense.filesize=` and change its value to `5000` (or higher if you want).
This is required so Android Studio can parse very large files to properly provide the auto-complete features.

{% include note.html content="If the line is missing (it should already be inside the file with current Android Studio versions), append it to the end of the file." %}

## Open the project in Android Studio

Open Android Studio and click on `Open existing project`.
Then navigate to your Android source directory and open the .ipr file.

{% include note.html content="Opening the project the first time can take a while. You should wait until any indexing of files is done to be sure that every IDE feature is ready to use." %}
