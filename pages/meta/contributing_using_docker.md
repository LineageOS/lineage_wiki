---
sidebar: home_sidebar
title: Contributing to the wiki using docker
folder: meta
permalink: contributing_using_docker.html
search: exclude
---

## Getting set up

You will need to sync the repo, and this tutorial will guide you through installing `docker-ce` and creating the
docker image. This will only need to be done once to get the environment setup. 

{% include warning.html content="Docker requires a 64 bit OS. If you do not have a 64 bit OS, do not continue" %}

### Install docker

```
# Add docker keyring
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install docker-ce
```

### Use docker without sudo

Add your user to the docker group in order to use docker commands without prefixing `sudo`:

```
sudo gpasswd -a $USER docker
newgrp docker
```

## Build the docker image

This builds the docker image, which should only need to be done once

```
cd $LINEAGE_SRC/lineage/wiki #Or to wherever you cloned the repository
docker build -t lineageos/wiki .
```

## Edit the wiki

Each time that you want to edit the wiki, you will need to start a local web server running Jekyll:

```
cd $LINEAGE_SRC/lineage/wiki
docker run -p 4000:4000 -v $(pwd):/src lineageos/wiki --incremental
```

At this point you should be able to view the [local Jekyll server](http://127.0.0.1:4000).

{% include tip.html content="The incremental flag will cause Jekyll to only reprocess each page as you change it (without the incremental flag, it would reprocess the entire site which takes 10-30+ seconds depending on your hardware). This works very well when editing meta pages but is a little annoying when editing the data/device/name.yml files. When editing those files you will need to save the data and then touch the `.md` file of the page that you are viewing in the browser. An easy way to do that is: `touch pages/*/<devicename>*`" %}
