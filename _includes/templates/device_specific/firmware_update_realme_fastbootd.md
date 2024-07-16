{% include alerts/warning.html content="These instructions are NOT for carrier branded variants." %}

{%- if device.before_install.instructions == "needs_specific_android_fw" and device.before_install.version -%}
1. Download the latest **Android {{ device.before_install.version }}** full stock ROM update using [realme-ota](https://github.com/R0rt1z2/realme-ota)
{%- else -%}
1. Download the latest full stock ROM update using [realme-ota](https://github.com/R0rt1z2/realme-ota)
{%- endif %}
2. Extract stock ROM using [payload-dumper-go](https://github.com/ssut/payload-dumper-go)
3. Boot up LineageOS recovery
4. Go to "Advanced" -> "Enter fastboot"
   {% include alerts/warning.html content="The \"Enter fastboot\" option may not be present on older LineageOS recovery builds and it cannot be substituted with \"Reboot to bootloader\"." %}
5. Execute following commands:
   ```
   {{- include.content -}}
   ```
