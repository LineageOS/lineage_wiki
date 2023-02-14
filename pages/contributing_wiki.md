---
sidebar: home_sidebar
title: Contributing to the wiki
folder: meta
permalink: contributing_wiki.html
---
So, you've decided you want to edit the wiki. Awesome! This page will show you how to get started. Please follow the instructions that are most appropriate for you.

## Cloning the wiki

### Using repo

If you already have a LineageOS source tree checked out, then this step is done for you. The wiki's git repository is present under `$LINEAGE_SRC/lineage/wiki`.

### Using git

If you don't have a LineageOS source tree on your device, then you can clone the wiki from GitHub to any directory you like. In this example, we'll use `~/lineage_wiki`.

#### Install Git

##### On Windows

Install [Git for Windows](https://git-for-windows.github.io/).

##### On macOS

Install Git using the [Git installer](https://git-scm.com/download/mac).

##### On Linux

You can install Git by running:

```
sudo apt-get install git
```

More specific instructions for different distributions can be found [here](https://git-scm.com/download/linux).

#### Configure Git

Run:

```
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
```

{% include alerts/tip.html content="Before this step, you can fork the LineageOS wiki repository and work on your own copy. That way you can preview your changes online using GitHub pages, which [we've detailed below](#preview-using-github). Just fork the repo and then replace LineageOS in the `git clone` command with your GitHub username." %}

```
git clone https://github.com/LineageOS/lineage_wiki ~/lineage_wiki
cd ~/lineage_wiki
curl -Lo .git/hooks/commit-msg https://review.lineageos.org/tools/hooks/commit-msg
chmod +x .git/hooks/commit-msg
```

## Making and previewing changes

You can now make changes in this folder using your favorite text editor. If you ever need to reset your folder to a known-good state, erasing your changes, just run:

```
git reset --hard HEAD
```

### Preview using GitHub

This is probably the easiest method, but requires you to have forked the wiki repository, and have cloned from that.

#### Commit and preview your changes

Run:

```
git add .
git commit
```

An editor will pop up. In the first line, type a short (below 80 character) description of your changes,
then put a blank line, and, if you want, a more detailed description of your changes. For example:
```
Add the contributing page

The contributing page will show people how they can edit our wiki, which
is important, since it wouldn't be much of a wiki without editors.
```
Save the file and exit the editor. Now upload your changes to GitHub:

```
git push origin
```

Preview your changes - you can see your fork of the wiki at `http://yourusername.github.io/lineage_wiki`.

#### Fixing mistakes

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

### Preview locally using docker

{% include alerts/warning.html content="Docker requires a 64 bit OS. If you do not have a 64 bit OS, do not continue." %}

#### Install docker

Add docker keyring and install the package:

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
```

Add your user account to the _docker_ group in order to use docker commands without prefixing `sudo`:

```
sudo gpasswd -a $USER docker
newgrp docker
```

Then log out of your user account and log back in or reboot to make the group membership changes take effect.

#### Build the docker image

This builds the docker image, which should only need to be done once:

```
cd $LINEAGE_SRC/lineage/wiki #Or to wherever you cloned the repository
docker build -t lineageos/wiki .
```

#### Edit the wiki

Each time that you want to edit the wiki, you will need to start a local web server running Jekyll:

```
cd $LINEAGE_SRC/lineage/wiki
docker run -p 4000:4000 -v $(pwd):/src -it lineageos/wiki
```

At this point you should be able to view the [local Jekyll server](http://127.0.0.1:4000).

### Preview locally using rvm and jekyll

#### Install `rvm`

`rvm` is a great tool to isolate different usages of ruby from each other. During this setup, you will install `ruby` and a set of ruby modules (gems) which will be isolated from any other ruby use on the machine (now and in the future).

If you don't have `rvm` already installed, go ahead and install it:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
```

#### Configure `ruby` for editing the wiki

These steps will configure and install the latest version of ruby MRI via `rvm`. All gems (modules) are stored in the namespace `lineage_wiki` and the environment will be configured to allow remote access to GitHub. Once configured, `ruby` will be installed and the required gems downloaded:

```
cd $LINEAGE_SRC/lineage/wiki
echo ruby > .ruby-version
echo lineage_wiki > .ruby-gemset
rvm install ruby
gem install bundler rails
bundle install
```

#### Edit the wiki

Each time that you want to edit the wiki, you will need to start a local web server running Jekyll:

```
source ~/.rvm/scripts/rvm
cd $LINEAGE_SRC/lineage/wiki
bundle exec jekyll serve --incremental
```

At this point you should be able to view the [local Jekyll server](http://127.0.0.1:4000).

{% include alerts/tip.html content="The incremental flag will cause Jekyll to only reprocess each page as you change it (without the incremental flag, it would reprocess the entire site which takes 10-30+ seconds depending on your hardware). This works very well when editing meta pages but is a little annoying when editing the data/device/name.yml files. When editing those files you will need to save the data and then touch the `.md` file of the page that you are viewing in the browser. An easy way to do that is: `touch pages/*/<devicename>*`" %}

{% include alerts/note.html content="If you work on a remote server and trust the network on which you are connected, you can add `--host <fully-qualified hostname>` to the Jekyll command line to allow remote connections to the server." %}


## Uploading your changes

LineageOS uses [Gerrit](https://review.lineageos.org/) to review proposed changes. Before you begin,
you'll need to [create an account](https://review.lineageos.org/login/%23%2Fregister%2Fq%2Fstatus%3Aopen),
and [configure an SSH key](https://review.lineageos.org/Documentation/user-upload.html#ssh) (you will need to use the **ed25519** type of key).

{% include alerts/note.html content="Creating a Gerrit account requires a Gmail-Address. Please also do not remove that address at a later point in time, as you won't be able to log in anymore!" %}

After you've done this, you can push your commits to Gerrit:

```
git remote add gerrit ssh://<gerritusername>@review.lineageos.org:29418/LineageOS/lineage_wiki
git push gerrit HEAD:refs/for/master
```

You can add the "Wiki Editors" group as reviewers (click on the little person to the right of "reviewers").
Someone will either: comment on the patch, asking for clarification or pointing out typos.
You can reply to them, or [fix any issues they point out](#fixing-mistakes), and then re-run:

```
git push gerrit HEAD:refs/for/master
```

Eventually, when your change looks _perfect_, someone will approve it, and submit it to the wiki. Awesome!
