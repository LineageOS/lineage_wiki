---
sidebar: home_sidebar
title: How to merge an upstream kernel
folder: internal
permalink: merging_upstream_kernel.html
search: exclude
tags:
 - internal
---

## Introduction

Patches from upstream Linux or AOSP are mostly based on a recent version of the kernel your device is running on which makes applying them a lot of manual work.
To make a maintainer's job easier, it can be a good idea to get your kernel in line with the upstream kernel in its latest version.
The following guide will walk you through the steps to merge the Linux kernel `v3.10.105` on top of the stock kernel based on `v3.10.49` on a device running `cm-14.1` and shows you, how to start.

The tools or commands given can be varied with the ones you already know and prefer.

{% include note.html content="Ideally at least two persons are doing the same work independently. This makes it easier to compare your progress and find potential mismerges." %}

## Preparation

This guide requires a fully set-up and working build environment and a buildable kernel. All commands are executed from within your kernel directory if not stated differently

### Fork the kernel

Go to the [LineageOS Org on GitHub](https://github.com/LineageOS) and select your device's kernel repository. On the top right corner you will find a button labelled `Fork`.
Press it and follow the steps to fork (= make a copy on your own GitHub account) the repository.

### Add the remotes

Switch to your kernel directory:

Add the upstream remote to yours and fetch it:

```
git remote add linux git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
git fetch linux
```

This will add a remote named `linux` to your list of remotes which can always be viewed with `git remote -v`.

To be able to compare the progress with others you can also add the forked repository as a remote.
This time we will use the `ssh` connection to be able to push asily without each push requiring your github userdata:

```
git remote add MyRemote git@github.com:YourGithubRepo/android_kernel_vendor_device.git
```

Replace `MyRemote` with any name you want to give the remote, the string `YourGithubRepo/android_kernel_vendor_device` can be easily taken from the browser when you navigate to your forked repository (take everything after `https://github.com/`).

### Find out your kernel's base version

Open the file `Makefile`. There will be some lines (usually the very first lines) indicating the base kernel version your current kernel is based on:

```
VERSION = 3
PATCHLEVEL = 10
SUBLEVEL = 49
EXTRAVERSION =
NAME = TOSSUG Baby Fish
[...]
```

Surely you already see the complete version there: `Version`.`Patchlevel`.`Sublevel` indicates the base version `3.10.49`

### Find out the target version

Navigate to [http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable](http://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git) (please note: the adress is the same we used when adding the remote `linux` apart from replacing `git://` with `http://`). On the summary page you will see a category `Branch` and, to no surprise, a branch which looks very much like we could need it: `linux-3.10.y`. Looking at the last commit message indicates our target version `Linux 3.10.105`.

### Clean your working directory

At this point make sure to not diverge from the current merged base of your kernel. Within your kernel directory execute:

```
repo sync .
```

## The actual merge

### Create a branch

You should always create a branch before working on something. This also enables the possibility to push the changes later:

```
git checkout -b merge
```

This will create the branch `merge` and switch to it directly (this is just an easier way to write `git branch merge && git checkout merge`)
You can of course also name the branch `merge` differently.

### Merging the base version

Not many vendors are known to keep their kernels close to stock. Many additions and changes are not usefull, while others are essential to keep your device in a working state. Still we need a base to work from during the chain of merges:

```
git merge --strategy=ours v3.10.49
```

This command will bring in the history of the base kernel but resolve all code to our current version. Please note the `v` in the beginning which is part of the branch name and which you could already have seen when adding the remote.

If it succeeds you will be presented with the commit dialog you should already be used to. Just keep the suggested submit message and proceed. Your kernel is now truly based on the branch `3.10.49`.

{% include note.html content="The branch name is unique and therefore doesn't need a prefix. In case you have multiple remotes with the same branches you have to use the fully qualified name `remotename/branchname`, e.g. `linux/v3.10.49`" %}

### Merging each other version

We suggest merging the versions one by one to solve conflicts easier and to always have a point to return to when something is getting strange:

```
git merge v3.10.50
```

You might also choose another version increment but the difference is and the possible conflicts will most likely be bigger.

There is two possible results now:

#### Failure (conflicts)

Didn't get a commit dialog? Pity, but unfortunately this most likely will be happening more than once. Every time the merging process fails due to some lines of code which do not match the patch being applied you will get some markers in the affected files and have to resolve the conflicts manually.

First, check the affected files:

```
git status
```

You are probably only interested in the lines stating a change from both sides. Open each of those in an editor of your choice and resolve the conflicts. Easy task, huh?

A conflict will always start with `<<<<<<< HEAD` (it should be enough to search for `<<<` to actually find it). The code between that marker and the following `=======` is the existing code, the code between the `=======` and the end marker `>>>>>>> v3.10.50` (with the branch name you tried to merge) the expected code (and very likely the additions made by the patch).

You can see what the patch actually wants to change by typing:

```
git diff v3.10.49 v3.10.50 your/conflicted/file.c
```

You can use this information to manually resolve the issue, which can be either keeping the original code, keeping the new code or combining both, depending on what was the target of the patch.

{% include note.html content="Don't forget to search for other conflict markers in the same file, there can be more than one conflict!" %}

After all conflicts in each of the files are solved, you can proceed with:

```
git add .
git commit
```

You can now continue with the [success step](#SuccessStep) below.

#### Success {#SuccessStep}

Congratulations, you are awarded a commit dialog which you keep unchanged and submit. Your kernel is now based on the version you used above.
Now you can either build the result and see if no compile errors arise or repeat the merge step until your kernel matches the most recent version.
You can also push your changes to your own repo:

```
git push MyRemote merge
```

With `MyRemote` and `merge` being the names you chose in the steps above.

{% include note.html content="You might want to try `git push -f MyRemote merge` in case this doesn't succeed. This will force an override of the history in case you changed something which was already pushed before." %}


## Useful links

* [GitHub help: Resolving conflicts](https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/)
