---
sidebar: home_sidebar
title: Using gerrit
permalink: usinggerrit-howto.html
---

## Using gerrit
[Gerrit](https://code.google.com/p/gerrit/) is a source code review system developed by Google for use with Android (though it can be applied to any type of project). You can use Gerrit if you find an error in the source code or if you believe you have a better way of implementing a certain feature.

Check out LineageOS's review system-- [Gerrit](http://review.lineageos.org), located at http://review.lineageos.org.

Here you can see what has been recently merged into the codebase. More interestingly, you can see what people have been submitting for review. If there's something you want to try, you can actually test it by merging it into your code and building. It's a simple matter.

## Retrieving and building a patch submission already on Gerrit

Let's say you'd like to try and [catch'em all](https://review.lineageos.org/#/c/65062/). (This is just an example of a proposed commit I found quickly that wasn't yet merged.)

To add this patch to your local build source code:

### Using `repopick`

`repopick` is a new command as of November, 2014 that makes adding proposed patches almost too easy.

If you type `repopick -h` you'll get a list of supported commands, such as the ability to do multiple patches or ranges of patches in a single command.

Here's all you do:

1. Note the URL of the proposed commit. In the above case, it's [https://review.lineageos.org/#/c/65062/](https://review.lineageos.org/#/c/65062/) That number, 65062 will come in handy in a second.
2. Go to the source code. `cd` to `android/system`.
3. Run Envsetup `. build/envsetup.sh` to add the function to your environment.
4. Now just type the following command: `repopick 65062` The patch should be applied automatically.
5. Go ahead and build. When you're done, you'll hopefully have the feature you wanted.
6. If it worked alright, go sign up for Gerrit and give a +1 vote to the proposed contribution.

### Manually applying the commit

Alternately, you can do the commit "manually" (that is, the OLD way of doing it):

1. Where it says Download in the middle of the screen, there's some instructions for you to highlight and copy. In this case, it looks like 
   `git fetch https://review.lineageos.org/LineageOS/android_frameworks_base refs/changes/62/65062/5 && git cherry-pick FETCH_HEAD` Or, you can click the little icon to the right of those instructions and the same text will automatically go to your copy buffer.
2. This patch affects <b>android_frameworks_base</b> (as you can see at the top of the gerrit description), so `cd frameworks/base`.
3. Now paste the command. You've just added the proposed change to your copy of the source code.
4. Go ahead and build. When you're done, you'll hopefully have the feature you wanted.
5. If it worked alright, go sign up for Gerrit and give a +1 vote to the proposed contribution.

{% include note.html content="The next time you do a `repo sync`, you'll probably have these changes overwritten." %}

## Submitting to Gerrit

1. If you have not already successfully downloaded the source and generated a build of CyanogenMod, make sure you are familiar with these steps. Information on doing a build is available elsewhere on this wiki.
2. Setup an account on Gerrit, you can register at review.cyanogenmod.org
3. Make sure your local git username matches with your Gerrit username, Gerrit username needs to be configure in the Gerrit portal under settings -> HTTP Password

   ```
   git config --global review.review.lineageos.org.username "gerrit username"
   ```

4. If you already have SSH keys set up (e.g. for Github), skip the following steps
5. Generate SSH keys,<sup>[[1]](#TroubleshootingTag)</sup> and copy/paste to your Gerrit account:

   ```
   ssh-keygen -t rsa -C "your@email.com"
   ```

6. Make sure your keys are added to your ssh agent:

   ```
   eval `ssh-agent -s`
   ssh-add ~/.ssh/id_rsa
   ssh-add
   ```

### Uploading your changes

First, you need to start a topic branch. This 'branch' holds the changes you make to the files on your computer that you will ultimately send to the CyanogenMod servers for review. Create your topic branch:

`repo start <branch name> <project path>`

{% include note.html content="This starts a new branch called '<branch name>' in the '<project path>' project. Replace <project path> with the path of your target repository instead." %}

Now, you can cd to the project (directory) that contains the file(s) you want to edit:

`cd path/to/project`

<b>Now you can make your changes.</b> *Make sure you do not edit any files before you run repo start, or your changes will happen on a different branch and will not be tracked correctly.*

After you make your changes, you can commit them just as you would normally:

```
git add <file you edited>
git commit
croot (Same as moving to top/root of tree using cd)
```

Now you can upload your changes to the CyanogenMod server:

`repo upload <project path>`

That's it! Your change will be reviewed and may be accepted or rejected.

See [#Example_cases](#ExanpleCasesTag) below for an example.

{% include tip.html content="The first line of your commit message will become the Change's Title. Add a blank line after the title and write the summary of changes there. Make sure that each line does not exceed 80 chars." %}

### Submitting Patch Sets

Frequently your submitted patch has issues or errors, which are noted in the code review, so you will want to resolve them. Sometimes it's just tabs instead of spaces or typos in strings and variable names. To avoid some formal mistakes, make sure you're familiar with the android code style. For Eclipse users, just follow the instructions in `development/ide/eclipse/README.importing-to-eclipse.txt`.

Before you edit those files, type in `git branch` to make sure you are on the correct branch. If you are not in the correct branch or in no branch at all, type in `git checkout [branchname]` to switch to the correct branch. Now you can edit the files. After you made your changes, do the usual `git status` and notice that `git diff` will only show you the changes you just made. Once you are satisfied, you can prepare the upload.

Type in `git commit --amend`. This will open an editor with your initial commit message. Make sure you have previously added the files that you've modified by using `git add`. The default editor is vi. This can be changed by the EDITOR environment variable to any editor you like. You can also change the commit message if you want to, but make sure the last two lines stay as are. They contain the initial commit ID and a blank line. With this id, Gerrit will detect your upload as a patch set and not as a new patch.

You can do `git log` and `git status` again. Notice how Git handles your initial commit and the commit using --amend as one patch. Same for `git show`. It will show you all the changes, your initial patch & the patch set you just committed, as one patch.

Now you can submit your patch set to your initial patch with `repo upload <project name>`.

## Example cases {#ExanpleCasesTag}

### Edit InputDevice.java

*  We want to make a change in InputDevice.java that resides in the frameworks/base project, and upload that to Gerrit for review. Let's start a local branch of that repo (directory) and call it mychanges:

   ```
   repo start mychanges frameworks/base
   ```

*  Now we make our edits to that file. We can check those changes:

   ```
   git add InputDevice.java -n
   ```

*  If the results are ok, we can stage the new file:

   ```
   git add InputDevice.java
   ```

*  Then commit it:

   ```
   git commit -m 'Added feature xyz'
   ```

*  Go to the root of your local android folder, and issue the upload:

   ```
   cd ~/android/system/
   repo upload frameworks/base
   ```

*  You should be asked a few questions and your commit should then be uploaded to Gerrit for review.


### Add AWEXT Support

*  Start the new branch

   ```
   cd ~/android/system/
   repo start mychanges-wpa_supplicant external/wpa_supplicant
   cd ~/android/system/project
   ```

*  Make changes, edit a few files, add new drivers.. etc.

   ```
   git add *
   git commit -am 'Added AWEXT drivers'
   cd ~/android/system
   repo upload external/wpa_supplicant
   ```


## Common Commands

See [Git Immersion](http://gitimmersion.com/) for more information

### Repo

*  `repo abandon <branch name>`

   To abandon any changes (commits) that have not been uploaded

*  `repo start <branch> <project>`

   Starts repo listening for changes through git

*  `repo upload <project name>`

   Uploads committed changes to the remote review server


### Git

*  `git add <file name>`

   stages a file that has been changed or added

*  `git commit -m "comment"`

   commits a change

*  `git reset HEAD <file name>`

   unstage a file

*  `git revert HEAD`

   undo the last commit

*  `git status`

   See the status of a project


## Troubleshooting  {#TroubleshootingTag}

   <sup>[1]</sup> If you get Permission denied (publickey). error, and you're sure that everything is right, try using a DSA key instead of RSA.
      `ssh-keygen -t dsa -C "<email>@<server>.<domain>"`

## Getting your submission reviewed/merged

All submitted patches go through a code review process prior to merger. In addition to getting reviewed by your peers, selected project members have the capability to merge your code into CyanogenMod (to make sure they get informed, add one or more responsible reviewers to your commit). To see a breakdown of who is responsible for the various aspects of CM, please see the Gerrit Reviewers list.

## Resources

[Git Immersion](http://gitimmersion.com/)

[Using git and repo](https://source.android.com/source/git-repo.html)

[Gerrit Documentation](https://review.lineageos.org/Documentation/index.html)



