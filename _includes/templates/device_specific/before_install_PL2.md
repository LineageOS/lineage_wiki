## Special Requirements

{% include alerts/warning.html content="Before following the instructions below please ensure that the device is on a Pie based firmware. If you are on an Android 8.0/8.1 (Oreo) firmware, please OTA to any Android 9.0 (Pie) build. If you are on Android 10, please download an Android 9.0 factory image and flash it." %}

# Installing a custom vendor image
The Nokia 6.1 (2018) uses a customized prebuilt vendor image. Please first follow the steps under the Basic Requirements header below, then follow the instructions below to install it:
1. Download LineageOS's custom vendor image from [here](https://www.androidfilehost.com/?fid=4349826312261717564).
2. Boot your device into fastboot mode:
 * {{ device.download_boot }}
3. Plug your device in via USB.
4. Run `fastboot flash vendor_a /path/to/vendor.img && fastboot flash vendor_b /path/to/vendor.img`.
 {% include alerts/tip.html content="The file may not be named identically to what stands in this command, so adjust accordingly." %}