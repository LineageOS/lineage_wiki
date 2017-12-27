#!/bin/bash

usage() {
    echo "Usage:"
    echo "  ./scripts/generate_device.sh device_name"
    echo
    exit 1
}

if [ "$#" -ne 1 ]; then
    usage
fi

DEVICE=$1

DATA_PATH="_data/devices/$DEVICE.md"
BUILD_PATH="pages/build/$DEVICE.md"
INFO_PATH="pages/info/$DEVICE.md"
INSTALL_PATH="pages/install/$DEVICE.md"

if ([ -e $BUILD_PATH ] || [ -e $DATA_PATH ] || [ -e $INFO_PATH ] || [ -e $INSTALL_PATH ]); then
    echo "One or more of these files already exists: $DATA_PATH, $BUILD_PATH, $INFO_PATH, $INSTALL_PATH"
    exit 1
fi

cp -a "device_sample/sample.yml" $DATA_PATH

# generate device info file
(cat << EOF) > $INFO_PATH
---
sidebar: home_sidebar
title: Info about $DEVICE
folder: info
layout: deviceinfo
permalink: /devices/$DEVICE/
device: $DEVICE
---
{% include templates/device_info.md %}

EOF

#generate build info for the device
(cat << EOF) > $BUILD_PATH
---
sidebar: home_sidebar
title: Build for $DEVICE
folder: build
permalink: /devices/$DEVICE/build
device: $DEVICE
---
{% include templates/device_build.md %}

EOF

# generate installation instructions for the device
(cat << EOF) > $INSTALL_PATH
---
sidebar: home_sidebar
title: Install LineageOS on $DEVICE
folder: install
permalink: /devices/$DEVICE/install
device: $DEVICE
---
{% include templates/device_install.md %}

EOF
