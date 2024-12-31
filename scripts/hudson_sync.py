#!/usr/bin/env python3
import os.path
from glob import glob

import yaml

supported_devices = {}

with open("../hudson/lineage-build-targets") as f:
    for line in f.readlines():
        line = line.split()

        if len(line) == 4:
            device = line[0]
            version = line[2]

            if version in ["lineage-20.0", "lineage-21.0"]:
                version = version[8:-2]
            else:
                version = version[8:]

            supported_devices[device] = version

for path in glob("_data/devices/*.yml"):
    codename = os.path.basename(path)
    codename = os.path.splitext(codename)[0]
    codename = codename.split("_variant")[0]
    version = supported_devices.get(codename, None)

    with open(path, "r+") as f:
        lines = ""

        for line in f.readlines():
            if version:
                if line.startswith("current_branch: "):
                    lines += f"current_branch: {version}\n"
                    continue

                if line.startswith("versions: ") and not line.endswith(f"{version}]\n"):
                    versions = ", ".join(line[11:-2].split(", ") + [version])
                    lines += f"versions: [{versions}]\n"
                    continue
            else:
                if line.startswith("maintainers: "):
                    lines += "maintainers: []\n"
                    continue

            lines += line

        f.seek(0)
        f.truncate()
        f.write(lines)
