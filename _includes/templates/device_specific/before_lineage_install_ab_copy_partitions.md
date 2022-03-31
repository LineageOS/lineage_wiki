## Ensuring all firmware partitions are consistent

{% include alerts/note.html content="The steps below only need to be run once per device." %}

In some cases slot `b` can be unpopulated or contain much older firmware than slot `a`, leading to various issues including a potential hard-brick. We can ensure none of that will happen by copying the contents of slot `a` to slot `b`.

To do this, sideload the `signed_copy-partitions_x.x.zip` package by doing the following:
1. Download the `signed_copy-partitions_x.x.zip` file from here: [signed_copy-partitions_x.x.zip](https://github.com/betaxab/copypartitions/releases).
{%- if device.uses_twrp %}
2. Sideload the `signed_copy-partitions_x.x.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload
    * On the host machine, sideload the package using: `adb sideload signed_copy-partitions_x.x.zip`
{%- else %}
2. Sideload the `signed_copy-partitions_x.x.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload signed_copy-partitions_x.x.zip`
    {% include alerts/note.html content="The copy-partitions script was created by LineageOS developer erfanoabdi and filipepferraz, but isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery  will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
3. Now reboot to recovery by tapping "Advanced", then "Reboot to recovery".
{%- endif %}
