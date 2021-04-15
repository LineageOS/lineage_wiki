---
sidebar: home_sidebar
title: How to use Gerrit
folder: how-tos
redirect_from: usinggerrit-howto.html
permalink: /how-to/using-gerrit
tags:
 - how-to
---

## What is Gerrit?

[Gerrit](https://code.google.com/p/gerrit/) is a source code review system developed by Google for use with Android (though it can be applied to any type of project). You must use Gerrit to submit code changes, in case you find an error in the source code, you want to contribute with good new features or even if you believe you have a better way of implementing a certain feature.

Check out LineageOS's review system - [Gerrit](https://review.lineageos.org).

There you can see what has been recently merged into the codebase. More interestingly, you can see what people have been submitting for review. If there's something you want to try, you can actually test it by merging it into your code and building. It's a simple matter.

## Reviewing a patch

A review system is defined by the ability to approve or disapprove changes and to verify them before they become part of the codebase. There are several possible ways to interact with the system, some are limited to specific users.
Anyone with an account can reply to a patch and add a label:

{:.table}
| Label | Definition | Meaning |
|-------|------------|---------|
| **-2** | Do not submit | This patch can't be submitted without the removal of the vote |
| **-1** | I would prefer that you didn't submit this | The code or the idea doesn't match the project's standards |
|  **0** | No score | I just have some generic info I'd like to share via the reply message |
| **+1** | Looks good to me, but someone else must approve | The code and idea meets the standards of the project |
| **+2** | Looks good to me, approved | After verification of the content this patch can be submitted |

The labels **+2** and **-2** are limited to the maintainers of the project or of the device a patch is meant for.

A patch can be submitted after verification ("does it build? does it still boot? does it not break anything?") which has its own labels (-1 / 0 / +1) and is then part of the code used for builds.

{% include alerts/important.html content="The several possible votes are **not** meant to be used as a 'Facebook-Like'. Giving a **+1** means you have read the commit message and the content of the patch and made sure they meet the project's standards in terms of coding, ideas and policies.  
The possibility of adding a comment doesn't mean you should add your opinion on patches randomly." %}

## Testing a patch

### Preparing the build environment

Go to the root of the source code:

```
cd ~/android/lineage
```

Setup your build environment:

```
source build/envsetup.sh
```

The rest of this guide will rely on this being done. You can check the proper execution of the commands by typing:

```
croot
```

Your shell will then navigate to the root of the sources, `~/android/lineage` or give an error.


### Retrieving an existing commit

Let's say you'd like to try and [catch'em all](https://review.lineageos.org/#/c/65062/) (just an example of a proposed commit that isn't merged).

To add this patch to your local build source code, you can use the `repopick` command:

If you type `repopick -h` you'll get a list of supported commands, such as the ability to pick multiple patches or ranges of patches in a single command.

Start by noting down the URL of the proposed commit. In the above example, it's [https://review.lineageos.org/#/c/65062/](https://review.lineageos.org/#/c/65062/). That number, `65062` will come in handy in a second.

The patch should be applied automatically after typing:

```
repopick 65062
```

Go ahead and build. When you're done, you'll hopefully have the feature you wanted. If it worked alright, go sign up for Gerrit and give a +1 vote to the proposed contribution.


## Submitting a patch

You can of course also contribute by submitting your own patch via Gerrit. Follow [this link]({{ "how-to/submitting-patches" | relative_url }}) to find out how to do it!


## Common commands

See [Git Immersion](http://gitimmersion.com/) for more information.

### `repo`

*  `repo abandon <branch name>` to abandon any changes (commits) that have not been uploaded.

*  `repo start <branch> <project>` to start repo listening for changes through git.

*  `repo upload <project name>` to upload committed changes to the remote review server.


### `git`

*  `git add <file name>` to stage a file that has been changed or added.

*  `git commit -m "comment"` to commit a change.

*  `git reset HEAD <file name>` to unstage a file.

*  `git revert HEAD` to undo the last commit.

*  `git status` to see the status of a project.


## Resources

[Git Immersion](http://gitimmersion.com/)

[Git and repo overview](https://source.android.com/source/developing)

[Gerrit Documentation](https://review.lineageos.org/Documentation/index.html)
