---
sidebar: home_sidebar
title: How to work with Repo
folder: how-tos
permalink: working-with-repo-howto.html
tags:
 - how-to
---

## What is Repo?

[Repo](https://source.android.com/setup/develop/repo) is a tool for combining
multiple Git repositories together into a large project.  Additionally Repo
includes shortcuts for using Gerrit as a source code review tool.

## Working with Repo

### Updating

The most commonly used operation for repo.  Simply run:

```
repo sync
```

### Working with multiple branches

Can one work with multiple LineageOS (or Android) branches in one repo area?
Must one instead setup a second set of repositories?

#### Switching between branches

Guessing this would use
`repo init -u https://github.com/LineageOS/android.git -b <branch>; repo sync`.

#### Setting up a second repo area with least storage/bandwidth

Is `cp -rlp <orig repo> <new repo>` workable?  Do the shared files cause
problems?

### Cleaning up

How to clean out previously used, but now unused repositories (something was
deleted from LineageOS, now need to clean out the local copy and free storage
space).

