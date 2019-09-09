## Important information

TWRP recovery versions before $(new_version) had a typo in the part of the format data code, which is used for userdata encryption in LineageOS. This issue is fixed on $(new_version) and newer.

Unfortunately, if you ever used a TWRP recovery version older than $(new_version) to format your data you will need to re-format your data.

Steps to make encryption work again:
- Make sure you now have the latest recovery version installed
- Backup all your personal data
- Boot to TWRP (home + power + volup)
- Go to Advanced -> Format data
- Reboot

Now you should be able to encrypt properly.
