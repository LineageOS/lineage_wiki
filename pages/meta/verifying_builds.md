---
sidebar: home_sidebar
title: Verifying Build Authenticity
folder: meta
permalink: verifying-builds.html
---

All official builds from LineageOS are signed with our private keys. You can verify a build has been signed with our keys by following those steps:

### Android Oreo (15.1)

Make sure that git, cmake and Go are installed:
```
sudo apt-get install git cmake golang
```

Download the source for the verifier and build it:

```
git clone https://github.com/LineageOS/update_verifier
cd update_verifier
git submodule update --init --recursive
./build.sh
```

Check the signature of the downloaded ZIP file:

```
./build/verifier /path/to/zip lineageos-key
```

If the program reports `whole-file signature verified`, the ZIP file is valid.

### Android Nougat (14.1) or older 

```
keytool -J-Duser.language=en -list -printcert -jarfile lineage-build-signed.zip
```

The resulting fingerprints are listed as follows: 

```
Certificate fingerprints:
         MD5:  F2:CA:AA:A7:2F:D6:34:FE:70:D7:5C:41:43:6C:5E:14
         SHA1: 9B:6D:F9:06:2A:1A:76:E6:E0:07:B1:1F:C2:EF:CB:EF:4B:32:F2:23
         SHA256: 51:83:25:EF:7F:96:C0:D1:19:4C:2E:85:6B:04:0D:63:61:66:FF:B8:46:71:7D:72:FA:87:F4:FA:E5:BE:7B:BB
```

For the paranoid, the contents of this page are stored on [our GitHub](https://github.com/lineageos/lineage_wiki/blob/master/pages/meta/verifying_builds.md). 
