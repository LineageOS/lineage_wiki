---
sidebar: home_sidebar
title: Contributing to the wiki via repo
folder: meta
permalink: contributing_via_repo.html
---
## Get set up

You will need to sync the repo, install rvm (a tool for managing ruby installations) and then configure ruby for the wiki.  This will only need to be done once to get the environment setup.

### Sync the repo


```
<project path="lineage_wiki" name="LineageOS/lineage_wiki" remote="github" revision="master" />
```

and then run ```repo sync lineage_wiki``` actually sync the repo.

### Install rvm

Rvm is a great tool to isolate different usages of ruby from each other.  During this setup, you will install ruby and a set of ruby modules (gems) which will be isolated from any other ruby use on the machine (now and in the future).

If you don't already have rvm installed, install it:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
```

### Configure ruby for editing the wiki

These steps will configure rvm to use the latest version of MRI ruby that is installed via rvm, all gems (modules) are stored in the namespace ```lineage_wiki``` and the environment will be configured to allow remote access to github.  Once configured, ruby will be installed and the required gems downloaded:

```
cd lineage_wiki/
echo ruby > .ruby-version
echo lineage_wiki > .ruby-gemset
echo JEKYLL_GITHUB_TOKEN=<insert a github personal access token here> > .ruby-env
echo PAGES_REPO_NWO=LineageOS/lineage_wiki >> .ruby-env
rvm install ruby
cd ../lineage_wiki/
gem install bundler rails
bundle install
```

## Edit the wiki

Each time that you want to edit the wiki, you will need to start a local web server running Jekyll:

```
source ~/.rvm/scripts/rvm
cd $LINEAGE_SRC/lineage_wiki/
bundle exec jekyll serve --incremental
```

At this point you should be able to view the [local Jekyll server](http://127.0.0.1:4000).

**NOTE**: The incremental flag will cause Jekyll to only reprocess each page as you change it (without the incremental flag, it would reprocess the entire site which takes 10-30+ seconds depending on your hardware).  This works very well when editing meta pages but is a little annoying when editind the data/device/name.yml files.  When editing those files you will need to save the data and then touch the ```.md``` file of the page that you are viewing in the browser.  An easy way to do that is

```
touch pages/*/<devicename>*
```

**NOTE**: If you work on a remote server and trust the network on which you are connected, you can add ```--host <fully-qualified hostname>``` to the Jekyll command line to allow remote connections to the server.
