## Ensuring all firmware partitions are consistent

{% include alerts/note.html content="The steps below only need to be run once per device." %}

In some cases, the inactive slot can be unpopulated or contain much older firmware than the active slot, leading to various issues including a potential hard-brick. We can ensure none of that will happen by copying the contents of the active slot to the inactive slot.

To do this, sideload the `copy-partitions-20210323_1922.zip` package by doing the following:
1. Download the `copy-partitions-20210323_1922.zip` file from [here](https://www.androidfilehost.com/?fid=2188818919693768129). If you get the file from third-party websites, it should have a MD5 sum of `92c010bf0371bfa6e55895c4c4750177` or a SHA-256 sum of `200877dfd0869a0e628955b807705765a91e34dff3bfeca9f828e916346aa85f`.
{%- if device.uses_twrp %}
2. Sideload the `copy-partitions-20210323_1922.zip` package:
    * On the device, select "Advanced", "ADB Sideload", then swipe to begin sideload
    * On the host machine, sideload the package using: `adb sideload copy-partitions-20210323_1922.zip`
{%- else %}
2. Sideload the `copy-partitions-20210323_1922.zip` package:
    * On the device, select "Apply Update", then "Apply from ADB" to begin sideload.
    * On the host machine, sideload the package using: `adb sideload copy-partitions-20210323_1922.zip`
    {% include alerts/note.html content="The copy-partitions script was created by LineageOS developer erfanoabdi and filipepferraz, but isn't signed with LineageOS's official key, and therefore when it is sideloaded, Lineage Recovery  will present a screen that says `Signature verification failed`, this is expected, please click `Continue`." %}
3. Now reboot to recovery by tapping "Advanced", then "Reboot to recovery".
{%- endif %}
