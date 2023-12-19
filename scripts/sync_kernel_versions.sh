#!/bin/bash

for f in _data/devices/*.yml; do
    repo=$(yq '.kernel.repo' $f)
    current_branch=$(yq '.current_branch' $f)

    if [ "${current_branch::2}" -gt 14 ]; then
        current_branch="lineage-$current_branch"
    else
        current_branch="cm-$current_branch"
    fi

    version=$(curl -s https://raw.githubusercontent.com/LineageOS/$repo/$current_branch/Makefile | grep -E '^(VERSION|PATCHLEVEL)')
    version=$(echo "$version" | xargs echo | awk '{ print $3"."$6 }')

    sed -i "s/^kernel:.*/kernel: {repo: $repo, version: '$version'}/" $f
done
