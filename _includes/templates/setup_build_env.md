{% if page.title == "How to submit a patch" %}

## Preparing the build environment

{% else %}

### Preparing the build environment

{% endif %}

Go to the root of the source code:

```
cd ~/android/lineage
```

Setup your build environment:

```
source build/envsetup.sh
```

The rest of this guide will rely on this being done. You can check the proper execution of the commands by typing:

```
croot
```

Your shell will then navigate to the root of the sources, `~/android/lineage` or give an error.
