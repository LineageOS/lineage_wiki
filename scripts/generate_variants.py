import os
import re
import shutil
import sys

from pathlib import Path

WIKI_PATH = str(Path(__file__).parents[1])
DEVICE_PATH = WIKI_PATH + "/_data/devices"
INFO_PATH = WIKI_PATH + "/pages/info"
INSTALL_PATH = WIKI_PATH + "/pages/install"
BUILD_PATH = WIKI_PATH + "/pages/build"
UPDATE_PATH = WIKI_PATH + "/pages/update"
UPGRADE_PATH = WIKI_PATH + "/pages/upgrade"
FW_UPDATE_PATH = WIKI_PATH + "/pages/fw_update"


def main(args):
    if len(args) != 2:
        device = input("Which device? ")
        amount = input("How many? ")
    else:
        device = args[0]
        amount = args[1]

    try:
        amount = int(amount)
    except (TypeError, ValueError):
        print("Could not convert to number!")
        exit(-1)

    orig_yaml = f"{DEVICE_PATH}/{device}.yml"
    orig_info = f"{INFO_PATH}/{device}.md"
    orig_install = f"{INSTALL_PATH}/{device}.md"
    orig_build = f"{BUILD_PATH}/{device}.md"
    orig_update = f"{UPDATE_PATH}/{device}.md"
    orig_upgrade = f"{UPGRADE_PATH}/{device}.md"
    orig_fw = f"{FW_UPDATE_PATH}/{device}.md"

    if not os.path.isfile(orig_yaml):
        print("Could not find yaml!")
        exit(-1)

    for i in range(amount):
        new_device = f"{device}_variant{i+1}"

        # Copy and modify yaml
        new_yaml = f"{DEVICE_PATH}/{new_device}.yml"
        shutil.copy2(orig_yaml, new_yaml)
        with open(new_yaml, "r+") as f:
            lines = f.readlines()
            f.seek(0)
            for line in lines:
                if line.startswith("vendor:"):
                    f.writelines(f"variant: {i+1}\n")
                f.writelines(line)
            f.truncate()
            f.close()

        # Info page
        new_info = f"{INFO_PATH}/{new_device}.md"
        replace_pages(orig_info, new_info, device, new_device, i + 1)

        # Install page
        new_install = f"{INSTALL_PATH}/{new_device}.md"
        replace_pages(orig_install, new_install, device, new_device, i + 1, "install")

        # Build page
        new_build = f"{BUILD_PATH}/{new_device}.md"
        replace_pages(orig_build, new_build, device, new_device, i + 1, "build")

        # Update page
        new_update = f"{UPDATE_PATH}/{new_device}.md"
        replace_pages(orig_update, new_update, device, new_device, i + 1, "update")

        # Upgrade page
        new_upgrade = f"{UPGRADE_PATH}/{new_device}.md"
        replace_pages(orig_upgrade, new_upgrade, device, new_device, i + 1, "upgrade")

        if os.path.isfile(orig_fw):
            new_fw = f"{FW_UPDATE_PATH}/{new_device}.md"
            replace_pages(orig_fw, new_fw, device, new_device, i + 1, "fw_update")

    # Original info and upgrade pages
    make_common_page("templates/variant_info.md", orig_info, device)
    make_common_page("templates/variant_upgrade.md", orig_upgrade, device)

    os.remove(orig_install)
    os.remove(orig_build)
    os.remove(orig_update)
    os.remove(orig_yaml)
    if os.path.isfile(orig_fw):
        os.remove(orig_fw)


def replace_pages(orig, new, device, new_device, variant_nr, target=None):
    shutil.copy2(orig, new)
    with open(new, "r+") as f:
        content = f.read()
        if target:
            content = re.sub(
                r"permalink: (.*)",
                f"permalink: /devices/{device}/{target}/variant{variant_nr}",
                content,
            )
        else:
            content = re.sub(
                r"permalink: (.*)",
                f"permalink: /devices/{device}/variant{variant_nr}/",
                content,
            )
        content = re.sub(r"device: (.*)", f"device: {new_device}", content)
        f.seek(0)
        f.write(content)
        f.close()


def make_common_page(template, path, device):
    shutil.copy2(template, path)
    with open(path, "r+") as f:
        content = f.read()
        content = content.replace("{codename}", device)
        f.seek(0)
        f.truncate()
        f.write(content)
        f.close()


if __name__ == "__main__":
    main(sys.argv[1:])
