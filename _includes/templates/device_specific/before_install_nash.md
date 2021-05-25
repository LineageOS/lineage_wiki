## Firmware Requirements

Before following these instructions please ensure that the device is on the latest firmware available for your variant. To discern this, run the command `adb shell getprop ro.boot.hardware.sku`. Please refer to the table below to discern what the latest firmware for your variant is:

| Variant | Version |
|---------|---------|
| XT1789-02/03/04 | 8.0 |
| XT1789-05/06/07 | 9.0 |
{: .table }

If the device's firmware version doesn't match the version required above, please go into "Settings", "System", "System Updates", click "Check for Updates", and apply any available. You may need to do this multiple times.

{% include alerts/warning.html content="If you follow these instructions on a firmware not explicitly listed as supported for your variant, or a firmware not intended for your variant, you are very likely to damage the device." %}
