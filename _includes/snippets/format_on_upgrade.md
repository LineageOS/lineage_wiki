{%- unless device.format_on_upgrade %}
{% include alerts/note.html content="Following these instructions will **not** wipe your data. It is, however, recommended to save important data before doing so, anyway!" %}
{%- endunless %}


{%- capture wiping_instructions %}
{%- if device.format_on_upgrade == "fbe" %}
8. If your device is not FBE encrypted, wipe your data partition (this is usually named "Wipe", or "Format").
    {% include alerts/note.html content="You can check if it's FBE encrypted by running the following command: `adb shell getprop ro.crypto.type`.
    If the output of this is `file`, then your device is FBE encrypted!" %}
{%- elsif device.format_on_upgrade == "repartition" %}
8. If your device is has not yet been repartitioned, please follow this device's [Install]({{ device | device_link: "/install" | relative_url }}) guide from the beginning, stopping once you reach "Installing LineageOS from recovery", once you reach this header you can proceed with these instructions.
    {% include alerts/note.html content="If you are uncertain if your device has been repartitioned, it likely has not!" %}
9. Wipe your data partition (this is usually named "Wipe", or "Format")
{%- elsif device.format_on_upgrade < device.current_branch %}
8. If your device is running LineageOS version older than {{ device.format_on_upgrade | precision: 1 }}, wipe your data partition (this is usually named "Wipe", or "Format").
{%- else %}
8. Wipe your data partition (this is usually named "Wipe", or "Format")
{%- endif %}
{%- endcapture %}
