{% include templates/device_specific/before_recovery_install_mithorium-common.md %}

## Flashing additional partitions

{% include alerts/warning.html content="This platform requires additional partitions to be flashed for recovery to work properly, the process to do so is described below." %}

1. Download the following files from [here](https://download.lineageos.org/devices/{{ device.codename }}).
  * dtbo.img
  * vbmeta.img
2. Flash the downloaded image files to your device by typing (replace `<...>` with the actual filenames!):
  ```
fastboot flash dtbo <dtbo>.img
fastboot flash vbmeta <vbmeta>.img
  ```
