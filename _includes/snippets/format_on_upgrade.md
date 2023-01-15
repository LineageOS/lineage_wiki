{%- unless device.format_on_upgrade %}
{% include alerts/note.html content="Following these instructions will **not** wipe your data. It is, however, recommended to save important data before doing so, anyway!" %}
{%- endunless %}

{% if device.format_on_upgrade == "fbe" %}
### Determine if you need to wipe your data

This device has switched its' encryption type between versions, possibly requiring you to wipe your data if you want to upgrade.\
To check if that is the case, open a shell on your computer and type the following:

```
adb shell getprop ro.crypto.type
```

If the output of this is `file` you can skip the wiping step below!

### Upgrade your LineageOS installation
{% endif %}