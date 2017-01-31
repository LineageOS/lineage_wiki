---
sidebar: home_sidebar
title: Contributing to the wiki using git
folder: meta
permalink: contributing_using_git.html
---
To get started, you'll need a [GitHub account](https://github.com).

## Getting set up

This wiki uses [GitHub pages](https://pages.github.com). In order to get ready to make your changes, you'll need to set up a few things:

### Install Git

#### On Windows

Install [Git for Windows](https://git-for-windows.github.io/).

#### On macOS

Install Git using the [Git installer](https://git-scm.com/download/mac).

#### On Linux

You can install Git by running:

```
sudo apt-get install git
```

More specific instructions for different distributions can be found [here](https://git-scm.com/download/linux).

### Configure Git

Run:

```
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
```

### Fork the wiki!

Visit [the wiki on GitHub](https://github.com/LineageOS/lineage_wiki), and click on the "fork" button in the top-right.
To ensure that your fork can be online for your own preview go to Settings and set your GitHub Pages publishing source to `master branch`.

### Download the wiki

Clone the wiki repo:

```
git clone https://github.com/YourUsername/lineage_wiki
```

The source of the wiki will be in the `lineage_wiki` folder.

## Edit the wiki

Congratulations! You now have a local copy of the wiki. You can find the majority of the pages in the `pages` folder, sorted (hopefully) logically in subfolders.
A lot of device-specific pages make use of templates, which can be found in `_includes`. Finally, information about devices is stored in `_data/devices`.

For more information, consult the [Jekyll documentation](http://jekyllrb.com/docs/home/), and the [Jekyll Documentation Theme documentation](http://idratherbewriting.com/documentation-theme-jekyll/index.html).

### Install the hook

To make sure that a Change-Id is automatically added to all your changes, install the hook once:

```
cd lineage_wiki
curl -Lo .git/hooks/commit-msg http://review.lineageos.org/tools/hooks/commit-msg
```

You can read about what the hook does [in the Gerrit documentation](https://review.lineageos.org/Documentation/user-changeid.html).

### Commit and preview your changes

Run:

```
git add .
git commit
```

An editor will pop up. In the first line, type a short (below 80 character) description of your changes,
then put a blank line, and, if you want, a more detailed description of your changes. For example:

        Add the contributing page

        The contributing page will show people how they can edit our wiki, which
        is important, since it wouldn't be much of a wiki without editors.

Save the file and exit the editor. Now upload your changes to GitHub:

```
git push origin
```

Preview your changes - you can see your fork of the wiki at `http://yourusername.github.io/lineage_wiki`.

### Fixing mistakes

So, you've made your change, and you can look at the wiki on GitHub pages. But something's wrong!
You made a typo - or accidentally deleted something. Have no fear! You can fix it.

First, fix the mistake(s) you made. Then, to push them to GitHub:

```
git add .
git commit --amend
```

Your commit message should show up in an editor. You can edit it, or just quit the editor.
Finally, run:

```
git push --force origin
```

## Getting your change live

LineageOS uses [Gerrit](http://review.lineageos.org/) to review proposed changes. Before you begin,
you'll need to [create an account](https://review.lineageos.org/login/%23%2Fregister%2Fq%2Fstatus%3Aopen),
and [configure an SSH key](https://review.lineageos.org/Documentation/user-upload.html#ssh).

After you've done this, you can push your commits to Gerrit:

```
git remote add gerrit ssh://<gerritusername>@review.lineageos.org:29418/LineageOS/lineage_wiki
git push gerrit HEAD:refs/for/master
```

You can add the "Wiki Editors" group as reviewers (click on the little person to the right of "reviewers"). Someone will
either: comment on the patch, asking for clarification or pointing out typos. You can reply to them,
or [fix any issues they point out](#fixing-mistakes), and then re-run:

```
git push gerrit HEAD:refs/for/master
```

Eventually, when your change looks _perfect_, someone will approve it, and submit it to the wiki. Awesome!

## Problems? Questions?

If you've got any problems following the instructions in this article, you can always ask in the [LineageOS subreddit](https://reddit.com/r/LineageOS), or
in [#LineageOS on freenode](https://webchat.freenode.net/?channels=LineageOS).
