---
sidebar: home_sidebar
title: Quirks - Remote
permalink: quirks/remote/
robots: noindex
search: exclude
toc: false
---

{% assign device = site.data.devices[page.device] %}

## Remote

{%- if device.remote_quirk == "shield" %}
Depending on which model of SHIELD TV you have, you will have a different remote, please refer to the table below to check compatibility:
|Remote                    |Codename     | Compatibile? | Reason         |
|--------------------------|-------------|--------------|----------------|
|[SHIELD Remote (2015)](https://www.nvidia.com/content/dam/en-zz/Solutions/SHIELD/shop/shield-remote-2015-625.png) | jarvis | Yes | N/A |
|[SHIELD Remote (2017)](https://www.nvidia.com/content/dam/en-zz/Solutions/SHIELD/shop/shield-remote-2017-625.png) | pepper | No | Requires Bluetooth BLE (Bluetooth Low Energy) stack hacks that stopped working long ago. |
|[SHIELD Remote (2019)](https://www.nvidia.com/content/shield/images/shield-remote.png) | friday | Yes | N/A |
|[SHIELD Controller (2015)](https://www.nvidia.com/content/shield/images/shield-controller-2015.png) | blake | No | Utilizes a proprietary Wi-Fi Direct implementation that has not been implemented functionally in LineageOS. |
|[SHIELD Controller (2017)](https://www.nvidia.com/content/shield/images/shield-controller.png) | thunderstrike | Yes | N/A |
{: .table }
{% else %}
The Bluetooth remote that ships with this device does not function in LineageOS builds. You will need to utilize another Bluetooth remote.
{% endif %}
