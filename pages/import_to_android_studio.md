---
sidebar: home_sidebar
title: How to import the sources to Android Studio / IntelliJ
permalink: import-android-studio-howto.html
tags: how-to
---

## Install Android Studio

Go to the [Download page](https://developer.android.com/studio/index.html#downloads) and download the package for your OS.

### On Windows

Execute the downloaded installer package and follow the setup until everything is installed

### On Linux (e.g. Ubuntu)

Unpack the downloaded file to a destination of your choice. Follow the instructions described in `Install-Linux-tar.txt` file which is in the extracted folder


## Prepare a project file

1) Open a  shell and navigate to the root folder of your android sources, e.g. `~/android/system` if you followed the "build for yourdevice" guide.

2) In case you have not done this yet, execute `source build/envsetup.sh`

{% include tip.html content="You can always check this by executing `croot` (go to your android root dir) and see if it gives an error. If not, you have already executed the source-command" %}

3) Execute this command: ```make idegen && development/tools/idegen/idegen.sh```

{% include note.html content="This can take some time while it goes through your tree and generates an Android Studio project based on it." %}

4) In case you are or plan to develop on multiple branches, do the following, else skip this step:

- Rename the *.ipr file: `mv android.ipr cm14.ipr`
- Rename and link the *.iml file: `mv android.iml CM14.iml && ln -s CM14.iml android.iml` (replace `CM14` by the naming scheme you want to use)

## Open the project in Android Studio

- Open Android Studio
- Click on `Open existing project`
- Navigate to your android source directory and open the .ipr file

{% include note.html content="Opening the project the first time can take a while. You should wait until any indexing of files is done to be sure that every IDE feature is ready to use." %}
