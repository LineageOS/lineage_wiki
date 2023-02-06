---
sidebar: home_sidebar
title: Signing Builds
permalink: signing_builds.html
---
## Generating the keys

{% include alerts/note.html content="You only need to run this once. If you ever rerun these, you'll need to
migrate between builds - see [Changing keys](#changing-keys)" %}

From the root of your Android tree, run these commands, altering the `subject` line to reflect your information:

```
subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com'
mkdir ~/.android-certs
for cert in bluetooth cyngn-app media networkstack platform releasekey sdk_sandbox shared testcert testkey verity; do \
    ./development/tools/make_key ~/.android-certs/$cert "$subject"; \
done
for apex-cert in com.android.adbd com.android.adservices com.android.adservices.api com.android.appsearch com.android.art com.android.bluetooth com.android.btservices com.android.cellbroadcast com.android.compos com.android.connectivity.resources com.android.conscrypt com.android.extservices com.android.hotspot2.osulogin com.android.i18n com.android.ipsec com.android.media com.android.media.swcodec com.android.media com.android.mediaprovider com.android.nearby.halfsheet com.android.neuralnetworks com.android.ondevicepersonalization com.android.os.statsd com.android.permission com.android.resolv com.android.runtime com.android.safetycenter.resources com.android.scheduling com.android.sdkext com.android.support.apexer com.android.telephony com.android.tethering com.android.tzdata com.android.uwb com.android.uwb.resources com.android.virt com.android.wifi com.android.wifi.dialog com.android.wifi.resources com.qorvo.uwb; do \
    ./development/tools/make_key ~/.android-certs/$apex-cert "$subject"; \
done
```

You should keep these keys safe, and store the passphrase in a secure location.

## Generating an install package

{% include alerts/tip.html content="If you wish to preserve your data coming from a Lineage build you
didn't build, see [Changing keys](#changing-keys)." %}

### Generating and signing target files

After following the build instructions for your device, instead of running `brunch <codename>`,
run the following:

```
breakfast <codename>
mka target-files-package otatools
```

Sit back and wait for a while - it may take a while depending on your computer's specs. After
it's finished, you just need to sign all the APKs:

{% include alerts/note.html content="For LineageOS versions older than 18.1 you will have to prepend \"./build/tools/releasetools/\" on the \"sign_target_files_apks\" and \"ota_from_target_files\" commands below." %}

```
croot
sign_target_files_apks -o -d ~/.android-certs \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip
```

### Generating the install package

Now, to generate the installable zip, run:

```
ota_from_target_files -k ~/.android-certs/releasekey \
    --block --backup=true \
    signed-target_files.zip \
    signed-ota_update.zip
```

Then, install the zip in recovery as you normally would.

## Changing keys

### Using a migration build

{% include alerts/warning.html content="Builds with these patches are insecure - they reset the keys
on all packages at every boot. Install them for as little time as possible." %}

You can set up your own migration builds by running:

LineageOS 19.1:
```
repopick -f 327460
```

LineageOS 18.1:
```
repopick -f 297539
```

LineageOS 17.1:
```
repopick -f 266939
```

LineageOS 16.0:
```
repopick -f 239520
```

LineageOS 15.1:
```
repopick -f 192655 -P vendor/lineage
repopick -f 192656 -P frameworks/base
```

LineageOS 14.1:
```
repopick -f 156047 162144
```

Then, follow the [instructions to generate an install package](#generating-an-install-package).

#### Going back

After installing the migration build, you can switch back to building normal builds:

LineageOS 19.1:
```
cd frameworks/base
git reset --hard github/lineage-19.1
```

LineageOS 18.1:
```
cd frameworks/base
git reset --hard github/lineage-18.1
```

LineageOS 17.1:
```
cd frameworks/base
git reset --hard github/lineage-17.1
```

LineageOS 16.0:
```
cd frameworks/base
git reset --hard github/lineage-16.0
```

LineageOS 15.1:
```
cd vendor/lineage
git reset --hard github/lineage-15.1
croot
cd frameworks/base
git reset --hard github/lineage-15.1
```

LineageOS 14.1:
```
cd vendor/cm
git reset --hard github/cm-14.1
croot
cd frameworks/base
git reset --hard github/cm-14.1
```

### Using a script

You can also use a script or small flashable zip designed to be run once, before installing
a build with the new keys. The script is available under
`./lineage/scripts/key-migration/script.sh`

The script can also be made into a zip, by inserting it into a zip similar to
[this](https://blunden.se/migration). This zip has the script placed in 
`META-INF/com/google/android/update-binary` with some additions to print status messages to
the recovery.

#### Test-keys to official or vice versa

If you are moving from a test-keys build (e.g. an "unsigned" unofficial build) to an official
LineageOS build, you can push the script to your device and run it from Android:

```
adb root # This requires an userdebug/eng build and ADB root access to be enabled
adb shell stop
adb push ./lineage/scripts/key-migration/migration.sh /data/local/tmp/migration.sh
adb shell chmod +x /data/local/tmp/migration.sh
adb shell sh /data/local/tmp/migration.sh official
adb reboot recovery
# Now install the official LineageOS install zip
```

Or run it from recovery:

```
# Ensure both /data and /system are mounted, then continue
adb push ./lineage/scripts/key-migration/migration.sh /data/local/tmp/migration.sh
adb shell chmod +x /data/local/tmp/migration.sh
adb shell sh /data/local/tmp/migration.sh official
```

If you are migrating from an official build to your own "unsigned" builds, you can run the
script in the same way, but instead using the argument "unofficial" instead of "official".

#### Test-keys to your own release-keys or vice versa

If you are moving from test-keys to your own signed builds, you can add your own keys to the
script. First, export your keys to the required format, by running the script in
`./lineage/scripts/key-migration/export-keys.sh`.

{% include alerts/note.html content="You may need to modify this script to change the location of
your certificate directory if you are not using the default certificate directory." %}

This will print the keys and certs to the terminal in the format required. Next, edit the
script to use your keys. You will need to comment out (by prepending a `#`), or remove the
existing definitions of the "release" keys and certs. Now, copy and paste your output from
above into the script where the previous lines were. Make sure to leave the "test" keys and
certs definitions untouched.

Your script is ready to go! Push it to the device and run it, in the same way as described
above, then install your own signed zip. If you ever need to run this in reverse, simply
use the "unofficial" argument instead of "official", and your keys will be replaced with
the official keys.
