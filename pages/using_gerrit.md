---
sidebar: home_sidebar
title: How to use Gerrit
permalink: usinggerrit-howto.html
tags: how-to
---

## Using Gerrit
[Gerrit](https://code.google.com/p/gerrit/) is a source code review system developed by Google for use with Android (though it can be applied to any type of project). You must use Gerrit to submit code changes, in case you find an error in the source code, you want to contribute with good new features or even if you believe you have a better way of implementing a certain feature.

Check out LineageOS's review system - [Gerrit](http://review.lineageos.org).

There you can see what has been recently merged into the codebase. More interestingly, you can see what people have been submitting for review. If there's something you want to try, you can actually test it by merging it into your code and building. It's a simple matter.

## Retrieving and building a patch submission already on Gerrit

Let's say you'd like to try and [catch'em all](https://review.lineageos.org/#/c/65062/) (just an example of a proposed commit that isn't merged).

To add this patch to your local build source code:

### Using `repopick`

`repopick` is a new command as of November, 2014 that makes adding proposed patches almost too easy.

If you type `repopick -h` you'll get a list of supported commands, such as the ability to pick multiple patches or ranges of patches in a single command.

Start by noting down the URL of the proposed commit. In the above example, it's [https://review.lineageos.org/#/c/65062/](https://review.lineageos.org/#/c/65062/). That number, 65062 will come in handy in a second.
Go to the root of the source code:

```
cd ~/android/system
```

Setup build environment:

```
source build/envsetup.sh
```

The patch should be applied automatically after typing:

```
repopick 65062
```

Go ahead and build. When you're done, you'll hopefully have the feature you wanted. If it worked alright, go sign up for Gerrit and give a +1 vote to the proposed contribution.

### Manually applying the commit

Alternately, you can do the commit "manually" (that is, the OLD way of doing it).

Look for the download dropdown menu on the change you want to apply. There will be some methods you can choose from, just highlight and copy (or simply click the little icon on the right).
Referring to the same example, to use the cherry-pick method, copy `git fetch https://review.lineageos.org/LineageOS/android_frameworks_base refs/changes/62/65062/5 && git cherry-pick FETCH_HEAD` to clipboard.
The example patch affects `android_frameworks_base` (as you can see at the top of the change description on Gerrit), so type:

```
cd frameworks/base
```

Now paste the command you copied from Gerrit. You've just added the proposed change to your copy of the source code.
Go ahead and build. When you're done, you'll hopefully have the feature you wanted. If it worked alright, go sign up for Gerrit and give a +1 vote to the proposed contribution.

{% include note.html content="The next time you do a `repo sync`, you'll probably have these changes overwritten." %}

## Submitting to Gerrit

If you haven't yet successfully downloaded the source and generated a build of LineageOS, make sure you are familiar with those steps. Information on doing a build is available elsewhere on this wiki.

Setup an account on [Gerrit](http://review.lineageos.org) and configure your Gerrit username in the Gerrit portal under **Settings -> HTTP Password**.
Then, make sure your local git username matches with your Gerrit username::

```
git config --global review.review.lineageos.org.username "gerrit username"
```

If you already have SSH keys set up (e.g. for GitHub), skip the following steps.

Generate SSH keys,<sup>[[1]](#TroubleshootingTag)</sup> and copy/paste to your Gerrit account under **Settings -> SSH Public Keys**:

```
ssh-keygen -t rsa -C "your@email.com"
```

Make sure your keys are added to your ssh agent:

```
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
ssh-add
```

### Uploading your changes

First, you need to start a topic branch. This 'branch' holds the changes you make to the files on your computer that you will ultimately send to the LineageOS's Gerrit instance for review. Create your topic branch:

```
repo start <branch name> <project path>
```

{% include note.html content="This starts a new branch called `<branch name>` in the `<project path>` project. Replace `<project path>` with the path of your target repository instead." %}

Change to the project (directory) that contains the file(s) you want to edit:

```
cd path/to/project
```

Do all the changes you need.

{% include warning.html content="Make sure you do not edit any files before you run `repo start`, otherwise your changes will happen on a different branch and will not be tracked correctly." %}

After you make your changes, you can commit them just as you normally would:

```
git add <file you edited>
git commit
croot
```

{% include tip.html content="The first line of your commit message will become the change's title. Add a blank line after the title and write the summary of changes there, if you would like. Make sure that each line does not exceed 80 chars." %}

Now you can upload your changes to Gerrit:

```
repo upload <project path>
```

That's it! Your change will be reviewed and may be accepted or rejected. See [#Example_cases](#ExampleCasesTag) below for an example.

### Submitting Patch Sets

In can happen that your submitted patch has issues or errors, which are noted in the code review, so you will want to resolve them. Sometimes it's just tabs instead of spaces or typos in strings and variable names. To avoid some formal mistakes, make sure you're familiar with the Android code style. For Eclipse users, just follow the instructions in `development/ide/eclipse/README.importing-to-eclipse.txt`.

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

This will open an editor with your initial commit message. You can change the commit message if you want to, but make sure the last two lines stay as are as it contains the initial change ID and a blank line. With this id, Gerrit will detect your upload as a patch set and not as a new patch.

{% include note.html content="The default editor is vi. This can be changed by the EDITOR environment variable to any editor you like." %}

You can do `git log` and `git status` again. Notice how git handles your initial commit and the amended commit as one single patch. As for `git show`, it shows you all the changes made on that commit.

Finally, you can submit your patch set to your initial patch by typing:

```
repo upload <project name>
```

## Bypassing Gerrit

{% include note.html content="The following tips are for those few who have the ability to accept changes into Gerrit's official LineageOS repositories and/or who are able to bypass Gerrit entirely. Only posted here for convenience for these maintainers, in case anyone forgets the steps." %}
{% include warning.html content="To mass-submit to Gerrit, you will need the *Push* and *Create Reference* permissions. For mass pushes that include commits you didn't create yourself, you may also need *Forge Author* and *Forge Committer* permissions. If you believe you are lacking appropriate permissions, contact a Gerrit admin for assistance." %}

Say you have a bunch of changes and want to skip Gerrit's interface entirely, pushing directly to the repository. For this you will need special privileges.

This is a summary of the user-upload feature, described in detail [here](https://review.lineageos.org/Documentation/user-upload.html).

### Preparation

Start by syncing the repo:

```
repo sync
```

Branch the repository to anything. In the new branch, add your commits (or merge from another branch, git pull from AOSP, or whatever gets your changes in).
Next, enter `cmremote`. This command will add the remote (use `git remote -v` to see it).

### To bypass Gerrit

Assuming `cm-14.1` is the branch to which you are pushing, type:

```
git push cmremote HEAD:refs/heads/cm-14.1
````

### To mass-push commits to Gerrit for review

Type the above mentioned command, but use `refs/for/branch` instead of `refs/heads/branch`.

### To create a new remote branch (on GitHub)

You can create a new (remote) branch by typing:

```
git push -u cmremote HEAD:refs/heads/new-branch-name
```

## Example cases {#ExampleCasesTag}

### Edit `InputDevice.java`

Let's say you want to make a change in `InputDevice.java` that resides in the `frameworks/base` project, and upload that to Gerrit for review. Start a local branch of that repo (directory) and call it mychanges:

```
repo start mychanges frameworks/base
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

Go to the root of your local source code folder, and issue the upload:

```
cd ~/android/system/
repo upload frameworks/base
```

You should be asked a few questions and your commit should then be uploaded to Gerrit for review.

### Add AWEXT Support

Start the new branch:

```
cd ~/android/system/
repo start mychanges-wpa_supplicant external/wpa_supplicant
cd ~/android/system/project
```

Make changes, edit a few files, add new drivers.. etc.

```
git add *
git commit -am 'Added AWEXT drivers'
cd ~/android/system
repo upload external/wpa_supplicant
```


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


## Troubleshooting  {#TroubleshootingTag}

   <sup>[1]</sup> If you get a "Permission denied (publickey)" error and you're sure that everything is right, try using a DSA key instead of RSA.
      `ssh-keygen -t dsa -C "<email>@<server>.<domain>"`

## Getting your submission reviewed/merged

All submitted patches go through a code review process prior to merger. In addition to getting reviewed by your peers, selected project members have the capability to merge your code into LineageOS (to make sure they get informed, add one or more responsible reviewers to your change). To see a breakdown of who is responsible for the various areas, please see the list of [LineageOS contributors](http://wiki.lineageos.org/contributors.html).

## Resources

[Git Immersion](http://gitimmersion.com/)

[Using git and repo](https://source.android.com/source/git-repo.html)

[Gerrit Documentation](https://review.lineageos.org/Documentation/index.html)



