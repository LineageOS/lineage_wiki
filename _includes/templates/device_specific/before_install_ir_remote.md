{% assign device = site.data.devices[page.device] %}

## Recovery Navigation

{% include alerts/note.html content="Please note that most devices will be able to navigate in recovery mode by pressing the <kbd>Side Button</kbd>/<kbd>Reset Button</kbd> to cycle through the on-screen options, and long-pressing the <kbd>Side Button</kbd>/<kbd>Reset Button</kbd> to select an option. However, if your device has a remote that communicates via Infrared (IR), the on-device button may not function correctly to change selection/select items in the recovery menu. If you hit this, please try utilizing your IR remote's <kbd>DPAD Directional Keyss</kbd> to change selection, and the <kbd>DPAD Center Button</kbd>/<kbd>Power Button</kbd> to select an item." %}

{% include templates/device_specific/before_install_needs_specific_android_fw.md %}
