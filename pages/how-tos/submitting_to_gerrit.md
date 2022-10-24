---
sidebar: home_sidebar
title: How to submit a patch
folder: how-tos
redirect_from: submitting-patch-howto.html
permalink: /how-to/submitting-patches
tags:
 - how-to
---


## Initial setup

If you haven't yet successfully downloaded the source and generated a build of LineageOS, make sure you are familiar with those steps. Information on doing a build is available in the build guide for [your device]({{ "devices/" | relative_url }}).

Setup an account on [Gerrit](https://review.lineageos.org), sign the [Contributor Agreement](https://review.lineageos.org/#/settings/agreements) and configure your Gerrit username in the Gerrit portal under **Settings -> HTTP Password**.

{% include alerts/important.html content="Gerrit ensures users have completed a valid Contributor Agreement prior to accepting any transferred objects, and if it is not completed, it aborts the network connection before data is sent." %}

Now make sure your local git username matches with your Gerrit username:

```
git config --global user.email 'you@yourDomain.com'
git config --global review.review.lineageos.org.username "gerritUsername"
```

{% include alerts/note.html content="Your Gerrit username is case-sensitive." %}

If you already have SSH keys set up (e.g. for GitHub), skip the following two steps.

Generate the SSH keys,<sup>[[1]](#TroubleshootingTag)</sup>:

```
ssh-keygen -t ed25519 -C "your@email.com"
```

Add the keys to the ssh-agent:

```
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
ssh-add
```

If you are using macOS, you need to run one of the following commands:

```
# macOS 11.x or older:
ssh-add -K ~/.ssh/id_ed25519 && ssh-add -A

# macOS 12.x and newer:
ssh-add --apple-use-keychain ~/.ssh/id_ed25519 && ssh-add --apple-load-keychain
```

After that, copy/paste the content of `~/.ssh/id_ed25519.pub` to your Gerrit SSH Settings under **Settings -> SSH Keys**.

Now, try the following command to see if you can successfully authenticate to Gerrit:

```
ssh gerritUsername@review.lineageos.org -p 29418
```

If the command above returns "Bad server host key: Invalid key length", you'll need to add the following lines to `~/.ssh/config`:

```
Host review.lineageos.org
    RSAMinSize 0
```

Otherwise it should show:

```
  ****    Welcome to Gerrit Code Review    ****

  Hi {name}, you have successfully connected over SSH.

  Unfortunately, interactive shells are disabled.
  To clone a hosted Git repository, use:

  git clone ssh://gerritUsername@review.lineageos.org:29418/REPOSITORY_NAME.git

Connection to review.lineageos.org closed.
```

The steps above have to be performed only once.


## Preparing the build environment

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


## Submitting to Gerrit

### Uploading your changes

First, you need to start a topic branch. This branch holds the changes you make to the files on your computer that you will ultimately send to the LineageOS' Gerrit instance for review. Create your topic branch:

```
repo start <branch name> <project path>
```

{% include alerts/note.html content="This starts a new branch called `<branch name>` in the `<project path>` project. Replace `<project path>` with the path of your target repository instead." %}

Change to the project (directory) that contains the file(s) you want to edit:

```
cd path/to/project
```

Do all the changes you need.

{% include alerts/warning.html content="Make sure you do not commit any changes before you run `repo start`, otherwise your changes will happen on a different branch and will not be tracked correctly." %}

After you make your changes, you can commit them just as you normally would:

```
git add <file you edited>
git commit
```
Alternatively you can run `git add .` to stage all changes.

{% include alerts/tip.html content="The first line of your commit message will become the change's title. Add a blank line after the title and write the summary of changes there, if you would like. Make sure that each line does not exceed 80 chars and the title should not exceed 50 chars." %}

Now you can upload your changes to Gerrit:

```
repo upload .
```

{% include alerts/note.html content="In case you are in the root of the source code, you can type: `repo upload <project path>`." %}

That's it! Your change will be reviewed and may be accepted or rejected. See [#Example_cases](#ExampleCasesTag) below for an example.


### Submitting patch sets

It can happen that your submitted patch has issues or errors, which are noted in the code review, so you will want to resolve them. Sometimes it's just tabs instead of spaces or typos in strings and variable names. To avoid some formal mistakes, make sure you're familiar with the Android code style. For Eclipse users, just follow the instructions in `development/ide/eclipse/README.importing-to-eclipse.txt`.

Before you edit those files, make sure you are on the correct branch:

```
git branch
```

If you are not or in no branch at all, switch to the correct branch:

```
git checkout [branchname]
```

Now you can edit the files you want. After that, do the usual `git status` and notice that `git diff` will only show you the changes you just made.
Make sure you add the files that you've modified by using `git add`. Once you're satisfied, prepare the upload, by amending your commit:

```
git commit --amend
```

This will open an editor with your initial commit message. You can change the commit message if you want to, but make sure the line starting with Change-Id remains unchanged as it contains the initial change ID. With this id, Gerrit will detect your upload as a patch set and not as a new patch.

{% include alerts/note.html content="The default editor is vi. This can be changed by the EDITOR environment variable to any editor you like." %}

You can do `git log` and `git status` again. Notice how git handles your initial commit and the amended commit as one single patch. As for `git show`, it shows you all the changes made on that commit.

Finally, you can submit your patch set to your initial patch by typing:

```
repo upload .
```

### Example cases {#ExampleCasesTag}

#### Edit `InputDevice.java`

Let's say you want to make a change in `InputDevice.java` that resides in the `frameworks/base` project, and upload that to Gerrit for review. Start a local branch of that repo (directory) and call it `mychanges`:

```
cd frameworks/base
repo start mychanges .
```

Make the edits to that file. You can check those changes:

```
git add InputDevice.java -n
```

If the results are acceptable, stage the modified file:

```
git add InputDevice.java
```

Then commit it:

```
git commit -m 'Added feature xyz'
```

Issue the upload:

```
repo upload .
```

You should be asked a few questions and your commit should then be uploaded to Gerrit for review.

#### Add AWEXT Support

Start the new branch:

```
cd external/wpa_supplicant
repo start mychanges-wpa_supplicant .
```

Make changes, edit a few files, add new drivers.. etc.

```
git add .
git commit -m 'Added AWEXT drivers'
repo upload .
```

### Troubleshooting  {#TroubleshootingTag}

<sup>[1]</sup> If you get a "Permission denied (publickey)" error and you're sure that everything is right, try using an RSA key instead of ED25519.

```
ssh-keygen -t rsa -C "your@email.com"
```

## Getting your submission reviewed/merged

All submitted patches go through a code review process prior to being merged. In addition to peer reviews, certain project members have the capability to merge your changes into LineageOS.
To make sure they get informed:

1) Add reviewers:
  - For device/kernel repos, add the [maintainer of your device]({{ "contributors.html#device-maintainers" | relative_url }})
  - For changes to various special projects (like this wiki), see the maintainers listed [here]({{ "contributors.html#other-projects" | relative_url }}). Note that the wiki editors can be added directly by typing "Wiki Editors" into the reviewer field
  - For all other repos, add the [Trusted Reviewers]({{ "contributors.html#trusted-reviewers" | relative_url }}) or [Committers]({{ "contributors.html#committers" | relative_url }})

2) Set the [proper labels]({{ "how-to/using-gerrit#reviewing-a-patch" | relative_url }}) to indicate your patch is ready

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

### `git subcommands`

*  `--date="DATE"` to specify the date of change if necessary. DATE has to be in RFC 2822, ISO 8601 or git internal time format.

   Examples:

     *  RFC 2822: Wed, 17 Jan 2018 17:39:48 +0100

     *  ISO 8601: 2018-01-17T17:39:48+0100

     *  git internal format: 1516210788 +0100


* `--author="NAME <EMAIL>"` to name the author if you did not write the patch yourself.

* `--amend` to modify the last commit.

## Resources

[Git Immersion](http://gitimmersion.com/)

[Git and repo overview](https://source.android.com/source/developing)

[Gerrit Documentation](https://review.lineageos.org/Documentation/index.html)
