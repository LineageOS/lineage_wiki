{%- unless device.format_on_upgrade %}
{% include alerts/note.html content="Following these instructions will **not** wipe your data. It is, however, recommended to save important data before doing so, anyway!" %}
{%- endunless %}


{%- capture wiping_instructions %}
{%- if device.format_on_upgrade == "fbe" %}
8. If your device is not FBE encrypted, wipe your data partition (this is usually named "Wipe", or "Format").
    {% include alerts/note.html content="You can check if it's FBE encrypted by running the following command: `adb shell getprop ro.crypto.type`.
    If the output of this is `file`, then your device is FBE encrypted!" %}
{%- else %}
8. Wipe your data partition (this is usually named "Wipe", or "Format")
{%- endif %}
{%- endcapture %}
