## Pre-install instructions

{% include alerts/warning.html content="Failure to follow these steps can result in a hard-brick" %}

In some cases slot `b` can be unpopulated or contain much older firmware than slot `a`, leading to various issues including a potential hard-brick. We can work around that by copying the contents of slot `a` to slot `b`.

To do this, sideload the copy-partitions.zip package by doing the following:
1. Download the `copy-partitions.zip` file from [here](https://androidfilehost.com/?fid=4349826312261712574).
{% if device.uses_twrp %}
2. Sideload the `copy-partitions.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload
    * On the host machine, sideload the package using: `adb sideload filename.zip`
{% else %}
2. Sideload the `copy-partitions.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload copy-partitions.zip`
    {% include alerts/note.html content="The copy-partitions script was created by LineageOS developer erfanoabdi and filipepferraz, but isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery  will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
{% endif %}
