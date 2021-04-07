{% include alerts/warning.html content="These instructions only apply to retail devices. If you happen to have a branded device you will have to download firmware files from elsewhere." %}

1. Download latest stock ROM from [oneplus.com](https://oneplus.com/support/softwareupgrade) or [Oxygen Updater](https://play.google.com/store/apps/details?id=com.arjanvlek.oxygenupdater).
   Oxygen Updater app usually happens to have newer releases available as OnePlus website tends to lag a bit.
2. Extract payload.bin using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
5. Execute following commands:
   ```
   {{- include.content -}}
   fastboot reboot
   ```
