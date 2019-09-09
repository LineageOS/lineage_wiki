## Important information

TWRP versions before $(new_version) had an issue where formatting the data partition would not leave space for the encryption footer LineageOS relies on. This issue is fixed in $(new_version) and newer.

Unfortunately, if you ever used a TWRP recovery version older than $(new_version) to format your data partition, you will need to re-format.

- To do so, follow these steps:
  - Make sure you now have the latest recovery version installed
  - Backup all your personal data
  - Boot to TWRP (home + power + volup)
  - Advanced -> Format data
  - Reboot
