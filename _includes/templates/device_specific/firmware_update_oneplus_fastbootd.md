{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

1. Download latest stock ROM from [oneplus.com](https://oneplus.com/support/softwareupgrade) or [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater).
   Oxygen Updater app usually happens to have newer releases available as OnePlus website tends to lag a bit.
2. Extract payload.bin using [update-payload-extractor](https://github.com/LineageOS/scripts/tree/master/update-payload-extractor)
   ```
   git clone https://github.com/LineageOS/scripts
   cd scripts/update-payload-extractor
   pip3 install --user protobuf
   python3 extract.py /path/to/payload.bin
   ```
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
5. Execute following commands:
   ```
   {{- include.content -}}
   fastboot reboot
   ```
