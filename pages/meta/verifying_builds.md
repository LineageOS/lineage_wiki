---
sidebar: home_sidebar
title: Verifying Build Authenticity
folder: meta
permalink: verifying-builds.html
---

All official builds from LineageOS are signed with our private keys. You can verify a build has been signed with our keys by following these steps:

Download the verifier and install its dependencies:

```
git clone https://github.com/LineageOS/update_verifier
cd update_verifier
pip install -r requirements.txt
```

Check the signature of the downloaded ZIP file:

```
python update_verifier.py lineageos_pubkey /path/to/zip
```

If the script reports `verified successfully`, the ZIP file signature is valid.

For the paranoid, the contents of this page are stored on [our GitHub](https://github.com/lineageos/lineage_wiki/blob/master/pages/meta/verifying_builds.md). 
