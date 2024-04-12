#!/bin/bash
for device in "$@"; do
    for x in _data/devices/${device}.yml _data/devices/${device}_variant*.yml; do
        sed -i "s/^maintainers: .*/maintainers: []/" $x 2>/dev/null
    done
done
