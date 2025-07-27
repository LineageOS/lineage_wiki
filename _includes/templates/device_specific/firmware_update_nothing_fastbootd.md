{%- if device.before_install.instructions == "needs_specific_android_fw" and device.before_install.version -%}
1. Download the latest **Android {{ device.before_install.version }}** full stock ROM update using [nothing_archive](https://github.com/spike0en/nothing_archive)
{%- else -%}
1. Download the latest full stock ROM update using [nothing_archive](https://github.com/spike0en/nothing_archive)
{%- endif %}
2. Extract stock ROM using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
5. Execute following commands:
   ```
   {{- include.content -}}
   ```

{% include snippets/fw_update_success.md %}
