## Retrofit Dynamic Partitions
{% include alerts/warning.html content="This step is not optional, LineageOS won't install without converting to Retrofit Dynamic Partitions first!" %}
1. Download super_empty.img image [here](https://download.lineageos.org/devices/{{ device.codename }}/builds){: .download}.
2. In recovery mode, select `Advanced` then select `Enter fastboot`.
3. Now open Terminal (Linux/macOS), or PowerShell (Windows), run this command to flash `super_empty` image:
    ```
    fastboot wipe-super --slot=all /path/to/super_empty.img
    ```
    {% include alerts/note.html content="You only need to do this if this is your first time installing LineageOS (or upgrading from an older version of LineageOS). This step is not required on future updates." %}
    {% capture content -%}
    If you get the following error: `fastboot: usage: unknown command wipe-super`, make sure [ADB and fastboot are updated to the latest version]({{ "adb_fastboot_guide.html" | relative_url }}). You need fastboot version 28.0.2 or greater.
    {%- endcapture %}
    {%- include alerts/note.html content=content %}
4. Back to your phone, select `Enter recovery`, and then proceed to the next installation steps.
