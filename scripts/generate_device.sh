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

DATA_PATH="_data/devices/$DEVICE.yml"
BUILD_PATH="pages/build/$DEVICE.md"
INFO_PATH="pages/info/$DEVICE.md"
INSTALL_PATH="pages/install/$DEVICE.md"

if [ ! -f $DATA_PATH ]; then
  cp -a "device_sample/sample.yml" $DATA_PATH
  sed -i "s/sample/$DEVICE/g" $DATA_PATH
fi

# generate device info file
if [ ! -f $INFO_PATH ]; then
  cat scripts/templates/info.md > $INFO_PATH
  sed -i "s/{codename}/$DEVICE/g" $INFO_PATH
fi

#generate build info for the device
if [ ! -f $BUILD_PATH ]; then
  cat scripts/templates/build.md > $BUILD_PATH
  sed -i "s/{codename}/$DEVICE/g" $BUILD_PATH
fi

# generate installation instructions for the device
if [ ! -f $INSTALL_PATH ]; then
  cat scripts/templates/install.md > $INSTALL_PATH
  sed -i "s/{codename}/$DEVICE/g" $INSTALL_PATH
fi
