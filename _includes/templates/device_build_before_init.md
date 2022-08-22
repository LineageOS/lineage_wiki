### What you'll need

{% if device -%}
* A {{ device.vendor }} {{ device.name }}.
{%- endif %}
* A relatively recent 64-bit computer:
  * Linux, macOS, or Windows - these instructions are only tested using Ubuntu LTS, so we recommend going with that.
  * A reasonable amount of RAM (16 GB to build up to `lineage-17.1`, 32 GB or more for `lineage-18.1` and up). The less RAM you have, the longer the build will take. Enabling ZRAM can be helpful.
  * A reasonable amount of Storage (200 GB to build up to `lineage-17.1`, 300 GB for `lineage-18.1` and up). You might require more free space for enabling `ccache` or building for multiple devices. Using SSDs results in considerably faster build times than traditional hard drives.
* A decent internet connection and reliable electricity. :)
* Some familiarity with basic Android operation and terminology.
 It may be useful to know some basic command line concepts such as `cd`, which stands for “change directory”, the concept of directory hierarchies, and that in Linux they are separated by `/`, etc.

{% include alerts/tip.html content="If you are not accustomed to using Linux, this is an excellent chance to learn. It’s free -- just download and run a virtual machine (VM) such as
[VirtualBox](https://www.virtualbox.org), then install a Linux distribution such as [Ubuntu](https://www.ubuntu.com) ([AOSP vets Ubuntu as well](https://source.android.com/source/initializing.html)).
Any recent 64-bit version should work great, but the latest Long Term Support (LTS) version is recommended. There are plenty of instructions on setting up VirtualBox to run Ubuntu, so we'll leave that to you. Though it is worth noting, if you already use either a Linux distro or macOS, you can just proceed." %}

Let's begin!

## Build LineageOS

{% if device %}
{% include alerts/note.html content="You only need to do these steps once. If you have already prepared your build environment and downloaded the source code,
skip to [Prepare the device-specific code](#prepare-the-device-specific-code)" %}
{% else %}
{% include alerts/note.html content="You only need to do these steps once. If you have already prepared your build environment and downloaded the source code,
skip to [Start the build](#start-the-build)" %}
{% endif %}

### Install the platform-tools

If you haven't previously installed `adb` and `fastboot`, you can [download them from Google](https://dl.google.com/android/repository/platform-tools-latest-linux.zip).
Extract it running:

```
unzip platform-tools-latest-linux.zip -d ~
```

{% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}

Now you have to add `adb` and `fastboot` to your PATH. Open `~/.profile` and add the following:

```
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
```

Then, run `source ~/.profile` to update your environment.

### Install the build packages

Several packages are needed to build LineageOS. You can install these using your distribution's package manager.

{% include alerts/tip.html content="A [package manager](https://en.wikipedia.org/wiki/Package_manager) in Linux is a system used to install or remove software
(usually originating from the Internet) on your computer. With Ubuntu, you can use the Ubuntu Software Center. Even better, you may also use the `apt-get install`
command directly in the Terminal." %}

{%- capture cpu_architecture %}
{%- if device.architecture.cpu -%}
   {{ device.architecture.cpu }}
{%- else -%}
   {{ device.architecture }}
{%- endif -%}
{%- endcapture -%}

To build LineageOS, you'll need:

* `bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick
   lib32ncurses5-dev lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev
   libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync
   schedtool squashfs-tools xsltproc {% if cpu_architecture contains 'x86' %}yasm {% endif %}
   zip zlib1g-dev`

{% if device.versions contains 13.0 %}
To build LineageOS 13.0, you'll also need:

* `maven`
{% endif %}

For Ubuntu versions older than 20.04 (focal), install also:

* `libwxgtk3.0-dev`

While for Ubuntu versions older than 16.04 (xenial), install:

* `libwxgtk2.8-dev`

#### Java

Different versions of LineageOS require different JDK (Java Development Kit) versions.

* LineageOS 18.1+: OpenJDK 11 (included in source download)
* LineageOS 16.0-17.1: OpenJDK 1.9 (included in source download)
* LineageOS 14.1-15.1: OpenJDK 1.8 (install `openjdk-8-jdk`)
* LineageOS 11.0-13.0: OpenJDK 1.7 (install `openjdk-7-jdk`)\*

\* Ubuntu 16.04 and newer do not have OpenJDK 1.7 in the standard package repositories. See the *Ask Ubuntu* question "[How do I install openjdk 7 on Ubuntu 16.04 or higher?](http://askubuntu.com/questions/761127/how-do-i-install-openjdk-7-on-ubuntu-16-04-or-higher)". Note that the suggestion to use PPA openjdk-r is outdated (the PPA has never updated their offering of openjdk-7-jdk, so it lacks security fixes); skip that answer even if it is the most upvoted.

### Create the directories

You'll need to set up some directories in your build environment.

To create them:

```
mkdir -p ~/bin
mkdir -p ~/android/lineage
```

The `~/bin` directory will contain the git-repo tool (commonly named "repo") and the `~/android/lineage` directory will contain the source code of LineageOS.

### Install the `repo` command

Enter the following to download the `repo` binary and make it executable (runnable):

```
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```

### Put the `~/bin` directory in your path of execution

In recent versions of Ubuntu, `~/bin` should already be in your PATH. You can check this by opening `~/.profile` with a text editor and verifying the following code exists (add it if it is missing):

```
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
```

Then, run `source ~/.profile` to update your environment.


### Configure git
Given that `repo` requires you to identify yourself to sync Android, run the following commands to configure your `git` identity:
```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```


### Turn on caching to speed up build

Make use of [`ccache`](https://ccache.samba.org/) if you want to speed up subsequent builds by running:

```
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
```

and adding that line to your `~/.bashrc` file. Then, specify the maximum amount of disk space you want `ccache` to use by typing this:

```
ccache -M 50G
```

where `50G` corresponds to 50GB of cache. This needs to be run once. Anywhere from 25GB-100GB will result in very noticeably increased build speeds
(for instance, a typical 1hr build time can be reduced to 20min). If you're only building for one device, 25GB-50GB is fine. If you plan to build
for several devices that do not share the same kernel source, aim for 75GB-100GB. This space will be permanently occupied on your drive, so take this
into consideration.

You can also enable the optional `ccache` compression. While this may involve a slight performance slowdown, it increases the number of files that fit in the cache. To enable it, run:

```
ccache -o compression=true
```

{% include alerts/note.html content="If compression is enabled, the `ccache` size can be lower (aim for approximately 20GB for one device)." %}


{% if device.current_branch >= 14 and device.current_branch < 16 %}
### Configure jack

[Jack](http://source.android.com/source/jack.html) is the currently used Java toolchain for building LineageOS 14.1 and 15.1. It is known to run out of memory often if not configured correctly - a simple fix is to run this command:

```
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
```

Adding that command to your `~/.bashrc` file will automatically configure Jack to allocate a sufficient amount of memory (in this case, 4GB).
{% endif %}
