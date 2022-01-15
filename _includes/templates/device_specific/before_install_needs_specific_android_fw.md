{% capture content %}
Before following these instructions please ensure that the device is on the latest **Android {{ device.before_install_args.version }}** firmware.<br/>
This is not necessarily the newest available version! Please up- or downgrade to the required version before proceeding (guides can be found on the internet!).
{% endcapture %}

{% include alerts/warning.html content=content %}
