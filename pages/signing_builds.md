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
```

LineageOS 19.1 and above will also require APEXes be re-signed.
Each APEX file is signed with two keys: one for the mini file system image within an APEX and the other for the entire APEX.
In this case, only SHA256_RSA4096 keys are allowed. You need to make a copy of `./development/tools/make_key` file and replace this line
```
gen_key_cmd="openssl genrsa -f4 2048"
```
with
```
gen_key_cmd="openssl genrsa -f4 4096"
```
Then generate the APEX keys altering the `subject` line to reflect your information. You will need to enter twice the passphrase for each APEX.
```
for apex in com.android.adbd com.android.adservices com.android.adservices.api com.android.appsearch com.android.art com.android.bluetooth com.android.btservices com.android.cellbroadcast com.android.compos com.android.connectivity.resources com.android.conscrypt com.android.extservices com.android.hotspot2.osulogin com.android.i18n com.android.ipsec com.android.media com.android.media.swcodec com.android.mediaprovider com.android.nearby.halfsheet com.android.neuralnetworks com.android.ondevicepersonalization com.android.os.statsd com.android.permission com.android.resolv com.android.runtime com.android.safetycenter.resources com.android.scheduling com.android.sdkext com.android.support.apexer com.android.telephony com.android.tethering com.android.tzdata com.android.uwb com.android.uwb.resources com.android.virt com.android.vndk.current com.android.wifi com.android.wifi.dialog com.android.wifi.resources com.qorvo.uwb; do \
    subject='/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN='$apex'/emailAddress=android@android.com'; \
    /your/make_key ~/.android-certs/$apex "$subject"; \
    openssl pkcs8 -in ~/.android-certs/$apex.pk8 -inform DER -out ~/.android-certs/$apex.pem; \
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
it's finished, you just need to sign all the APKs and APEXes:

{% include alerts/note.html content="For LineageOS versions older than 18.1 you will have to prepend \"./build/tools/releasetools/\" on the \"sign_target_files_apks\" and \"ota_from_target_files\" commands below." %}

You may set `ANDROID_PW_FILE` and `EDITOR` environment variables for a more convenient way to enter certificate passwords. When you invoke the `sign_target_files_apks` command, the editor will open `ANDROID_PW_FILE` if this file is missing any relevant certificate passwords.
```
# Enter key passwords between the [[[ ]]] brackets
# (Additional spaces are harmless)

[[[    ]]] /your/home/.android-certs/bluetooth
[[[    ]]] /your/home/.android-certs/com.android.adbd
etc...
```
Populate the missing passwords, save the file, and close the editor. Make sure to store this file in a secure location.

Signing process for LineageOS versions 18.1 and below:
```
croot
sign_target_files_apks -o -d ~/.android-certs \
    $OUT/obj/PACKAGING/target_files_intermediates/*-target_files-*.zip \
    signed-target_files.zip
```
Signing process for LineageOS versions 19.1 and above:
```
croot
sign_target_files_apks -o -d ~/.android-certs \
    --extra_apks com.android.adbd.apex=$HOME/.android-certs/com.android.adbd \
    --extra_apex_payload_key com.android.adbd.apex=$HOME/.android-certs/com.android.adbd.pem \
    --extra_apks com.android.adservices.apex=$HOME/.android-certs/com.android.adservices \
    --extra_apex_payload_key com.android.adservices.apex=$HOME/.android-certs/com.android.adservices.pem \
    --extra_apks com.android.appsearch.apex=$HOME/.android-certs/com.android.appsearch \
    --extra_apex_payload_key com.android.appsearch.apex=$HOME/.android-certs/com.android.appsearch.pem \
    --extra_apks com.android.art.apex=$HOME/.android-certs/com.android.art \
    --extra_apex_payload_key com.android.art.apex=$HOME/.android-certs/com.android.art.pem \
    --extra_apks com.android.bluetooth.apex=$HOME/.android-certs/com.android.bluetooth \
    --extra_apex_payload_key com.android.bluetooth.apex=$HOME/.android-certs/com.android.bluetooth.pem \
    --extra_apks com.android.btservices.apex=$HOME/.android-certs/com.android.btservices \
    --extra_apex_payload_key com.android.btservices.apex=$HOME/.android-certs/com.android.btservices.pem \
    --extra_apks com.android.cellbroadcast.apex=$HOME/.android-certs/com.android.cellbroadcast \
    --extra_apex_payload_key com.android.cellbroadcast.apex=$HOME/.android-certs/com.android.cellbroadcast.pem \
    --extra_apks com.android.compos.apex=$HOME/.android-certs/com.android.compos \
    --extra_apex_payload_key com.android.compos.apex=$HOME/.android-certs/com.android.compos.pem \
    --extra_apks com.android.connectivity.resources.apex=$HOME/.android-certs/com.android.connectivity.resources \
    --extra_apex_payload_key com.android.connectivity.resources.apex=$HOME/.android-certs/com.android.connectivity.resources.pem \
    --extra_apks com.android.conscrypt.apex=$HOME/.android-certs/com.android.conscrypt \
    --extra_apex_payload_key com.android.conscrypt.apex=$HOME/.android-certs/com.android.conscrypt.pem \
    --extra_apks com.android.extservices.apex=$HOME/.android-certs/com.android.extservices \
    --extra_apex_payload_key com.android.extservices.apex=$HOME/.android-certs/com.android.extservices.pem \
    --extra_apks com.android.hotspot2.osulogin.apex=$HOME/.android-certs/com.android.hotspot2.osulogin \
    --extra_apex_payload_key com.android.hotspot2.osulogin.apex=$HOME/.android-certs/com.android.hotspot2.osulogin.pem \
    --extra_apks com.android.i18n.apex=$HOME/.android-certs/com.android.i18n \
    --extra_apex_payload_key com.android.i18n.apex=$HOME/.android-certs/com.android.i18n.pem \
    --extra_apks com.android.ipsec.apex=$HOME/.android-certs/com.android.ipsec \
    --extra_apex_payload_key com.android.ipsec.apex=$HOME/.android-certs/com.android.ipsec.pem \
    --extra_apks com.android.media.apex=$HOME/.android-certs/com.android.media \
    --extra_apex_payload_key com.android.media.apex=$HOME/.android-certs/com.android.media.pem \
    --extra_apks com.android.media.swcodec.apex=$HOME/.android-certs/com.android.media.swcodec \
    --extra_apex_payload_key com.android.media.swcodec.apex=$HOME/.android-certs/com.android.media.swcodec.pem \
    --extra_apks com.android.mediaprovider.apex=$HOME/.android-certs/com.android.mediaprovider \
    --extra_apex_payload_key com.android.mediaprovider.apex=$HOME/.android-certs/com.android.mediaprovider.pem \
    --extra_apks com.android.nearby.halfsheet.apex=$HOME/.android-certs/com.android.nearby.halfsheet \
    --extra_apex_payload_key com.android.nearby.halfsheet.apex=$HOME/.android-certs/com.android.nearby.halfsheet.pem \
    --extra_apks com.android.neuralnetworks.apex=$HOME/.android-certs/com.android.neuralnetworks \
    --extra_apex_payload_key com.android.neuralnetworks.apex=$HOME/.android-certs/com.android.neuralnetworks.pem \
    --extra_apks com.android.ondevicepersonalization.apex=$HOME/.android-certs/com.android.ondevicepersonalization \
    --extra_apex_payload_key com.android.ondevicepersonalization.apex=$HOME/.android-certs/com.android.ondevicepersonalization.pem \
    --extra_apks com.android.os.statsd.apex=$HOME/.android-certs/com.android.os.statsd \
    --extra_apex_payload_key com.android.os.statsd.apex=$HOME/.android-certs/com.android.os.statsd.pem \
    --extra_apks com.android.permission.apex=$HOME/.android-certs/com.android.permission \
    --extra_apex_payload_key com.android.permission.apex=$HOME/.android-certs/com.android.permission.pem \
    --extra_apks com.android.resolv.apex=$HOME/.android-certs/com.android.resolv \
    --extra_apex_payload_key com.android.resolv.apex=$HOME/.android-certs/com.android.resolv.pem \
    --extra_apks com.android.runtime.apex=$HOME/.android-certs/com.android.runtime \
    --extra_apex_payload_key com.android.runtime.apex=$HOME/.android-certs/com.android.runtime.pem \
    --extra_apks com.android.safetycenter.resources.apex=$HOME/.android-certs/com.android.safetycenter.resources \
    --extra_apex_payload_key com.android.safetycenter.resources.apex=$HOME/.android-certs/com.android.safetycenter.resources.pem \
    --extra_apks com.android.scheduling.apex=$HOME/.android-certs/com.android.scheduling \
    --extra_apex_payload_key com.android.scheduling.apex=$HOME/.android-certs/com.android.scheduling.pem \
    --extra_apks com.android.sdkext.apex=$HOME/.android-certs/com.android.sdkext \
    --extra_apex_payload_key com.android.sdkext.apex=$HOME/.android-certs/com.android.sdkext.pem \
    --extra_apks com.android.support.apexer.apex=$HOME/.android-certs/com.android.support.apexer \
    --extra_apex_payload_key com.android.support.apexer.apex=$HOME/.android-certs/com.android.support.apexer.pem \
    --extra_apks com.android.telephony.apex=$HOME/.android-certs/com.android.telephony \
    --extra_apex_payload_key com.android.telephony.apex=$HOME/.android-certs/com.android.telephony.pem \
    --extra_apks com.android.tethering.apex=$HOME/.android-certs/com.android.tethering \
    --extra_apex_payload_key com.android.tethering.apex=$HOME/.android-certs/com.android.tethering.pem \
    --extra_apks com.android.tzdata.apex=$HOME/.android-certs/com.android.tzdata \
    --extra_apex_payload_key com.android.tzdata.apex=$HOME/.android-certs/com.android.tzdata.pem \
    --extra_apks com.android.uwb.apex=$HOME/.android-certs/com.android.uwb \
    --extra_apex_payload_key com.android.uwb.apex=$HOME/.android-certs/com.android.uwb.pem \
    --extra_apks com.android.uwb.resources.apex=$HOME/.android-certs/com.android.uwb.resources \
    --extra_apex_payload_key com.android.uwb.resources.apex=$HOME/.android-certs/com.android.uwb.resources.pem \
    --extra_apks com.android.virt.apex=$HOME/.android-certs/com.android.virt \
    --extra_apex_payload_key com.android.virt.apex=$HOME/.android-certs/com.android.virt.pem \
    --extra_apks com.android.vndk.current.apex=$HOME/.android-certs/com.android.vndk.current \
    --extra_apex_payload_key com.android.vndk.current.apex=$HOME/.android-certs/com.android.vndk.current.pem \
    --extra_apks com.android.wifi.apex=$HOME/.android-certs/com.android.wifi \
    --extra_apex_payload_key com.android.wifi.apex=$HOME/.android-certs/com.android.wifi.pem \
    --extra_apks com.android.wifi.dialog.apex=$HOME/.android-certs/com.android.wifi.dialog \
    --extra_apex_payload_key com.android.wifi.dialog.apex=$HOME/.android-certs/com.android.wifi.dialog.pem \
    --extra_apks com.android.wifi.resources.apex=$HOME/.android-certs/com.android.wifi.resources \
    --extra_apex_payload_key com.android.wifi.resources.apex=$HOME/.android-certs/com.android.wifi.resources.pem \
    --extra_apks com.qorvo.uwb.apex=$HOME/.android-certs/com.qorvo.uwb \
    --extra_apex_payload_key com.qorvo.uwb.apex=$HOME/.android-certs/com.qorvo.uwb.pem \
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
`./lineage/scripts/key-migration/migration.sh`

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
adb shell sh /data/local/tmp/migration.sh official
adb reboot recovery
# Now install the official LineageOS install zip
```

Or run it from recovery:

```
# Ensure both /data and /system are mounted, then continue
adb push ./lineage/scripts/key-migration/migration.sh /data/local/tmp/migration.sh
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
