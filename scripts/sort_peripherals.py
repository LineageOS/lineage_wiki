#!/usr/bin/env python3
from glob import glob

import yaml

with open("_data/schema.yml") as f:
    schema = yaml.safe_load(f)
    valid_peripherals = schema["definitions"]["valid_peripherals"]["items"]["enum"]

for device in glob("_data/devices/*.yml"):
    with open(device, "r") as f:
        lines = f.readlines()

    for i, line in enumerate(lines):
        if line == "peripherals: None\n":
            continue

        if line.startswith("peripherals:"):
            peripherals_current = line[14:-2].split(", ")
            peripherals_new = []

            for peripheral in valid_peripherals:
                if peripheral in peripherals_current:
                    peripherals_new.append(peripheral)

            lines[i] = f"peripherals: [{', '.join(peripherals_new)}]\n"

            break

    with open(device, "w") as f:
        f.write("".join(lines))
