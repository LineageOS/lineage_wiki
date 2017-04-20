---
sidebar: home_sidebar
title: Signing Builds
permalink: signing_builds.html
---
## Generating the keys

{% include note.html content="You only need to run this once. If you ever rerun these, you'll need to
migrate between builds - see [Changing keys](#changing-keys)" %}

From the root of your Android tree, run these commands, altering the `subject` line to reflect your information:

```
subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com'
mkdir ~/.android-certs
for x in releasekey platform shared media; do \
    ./development/tools/make_key ~/.android-certs/$x "$subject"; \
done
```

You should keep these keys safe, and store the passphrase in a secure location.

## Generating an install package

{% include tip.html content="If you wish to preserve your data coming from a Lineage build you
didn't build, see [Changing keys](#changing-keys)." %}

### Generating and signing target files

After following the build instructions for your device, instead of running `brunch <codename>`,
run the following:

```
breakfast <codename>
mka target-files-package dist
```

Sit back and wait for a while - it may take a while depending on your computer's specs. After
it's finished, you just need to sign all the APKs:

```
croot
./build/tools/releasetools/sign_target_files_apks -o -d ~/.android-certs \
    out/dist/*-target_files-*.zip \
    signed-target_files.zip
```

### Generating the install package

Now, to generate the installable zip, run:

```
./build/tools/releasetools/ota_from_target_files -k ~/.android-certs/releasekey \
    --block --backup=true \
    signed-target_files.zip \
    signed-ota_update.zip
```

Then, install the zip in recovery as you normally would.

## Changing keys

{% include warning.html content="Builds with these patches are insecure - they reset the keys
on all packages at every boot. Install them for as little time as possible." %}

You can set up your own migration builds by running:

```
repopick -f 156047 162144
```

Then, follow the [instructions to generate an install package](#generating-an-install-package).

### Going back

After installing the migration build, you can switch back to building normal builds:

```
cd vendor/cm
git reset --hard github/cm-14.1
croot
cd frameworks/base
git reset --hard github/cm-14.1
```
