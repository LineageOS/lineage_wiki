<br/>
The following devices are all using the same build, either because the vendor released the same device with different names or the maintainer
chose or managed to support multiple devices using the same code.<br/>
Instructions may vary between these variants, so please choose your actual model!

{%- assign devices = "" | split: " " %}
{%- for dev in site.data.devices %}
  {%- if dev[1].codename == page.device %}
    {%- assign devices = devices | push: dev[1] %}
  {%- endif %}
{%- endfor %}
{%- assign sorted = devices | sort_natural: 'name' %}

{%- assign different_cam = false %}
{%- assign max_cams = sorted[0].cameras | size %}
{%- assign different_dimensions = false %}
{%- assign different_battery = false %}
{%- for device in sorted %}
  {%- unless forloop.first %}
    {% assign current_cams = device.cameras | size %}
    {%- if device.cameras != sorted[0].cameras %}
      {%- assign different_cam = true %}
      {%- if current_cams > max_cams %}
        {%- assign max_cams = current_cams %}
      {%- endif %}
    {%- endif %}
    {%- if device.dimensions != sorted[0].dimensions %}
      {%- assign different_dimensions = true %}
    {%- endif %}
    {%- if device.battery != sorted[0].battery %}
      {%- assign different_battery = true %}
    {%- endif %}
  {%- endunless %}
{%- endfor %}

<div class="variants">

{%- for device in sorted %}
{%- if include.info %}
{%- assign url = "/devices/" | append: device.codename | append: "/variant" | append: device.variant | append: "/" | relative_url %}
{%- else %}
{%- assign url = "/devices/" | append: device.codename | append: "/variant" | append: device.variant | append: "/upgrade" | relative_url %}
{%- endif %}
<div class="variant_item" onClick="location.href='{{ url }}'">
<a href="{{ url }}" class="device_link">{{ device.name }}</a><br/>
<table class="deviceinfo table variant_info">
  <tbody>

  {%- if different_cam %}
  <tr>
    <th scope="row">Cameras</th>
    <td>{{ device.cameras | size }}
        <ul>
            {%- for el in device.cameras %}
                <li>
                  {% capture cam_info %}{{ el.info }}, {% if el.flash != 'None' %}{{ el.flash }}{% else %} No{% endif %} flash{% endcapture %}
                  {% assign cam_info = cam_info | truncate: 15 %}
                  {{ cam_info }}
                </li>
            {%- endfor %}
            {% assign current_cams = device.cameras | size %}
            {% assign diff = max_cams | minus: current_cams %}
            {% if diff > 0 %}
              {% for i in (1..diff) %}
              <br/>
              {% endfor %}
            {% endif %}
        </ul>
    </td>
  </tr>
  {%- endif %}

  {%- if different_dimensions %}
    <tr>
        <th scope="row">Dimensions</th>
        <td>{%- if device.dimensions.first.size == 1 %}
              {%- comment %}The size of "first" will be 1 when there is a list of models{% endcomment -%}
              {%- for model in device.dimensions %}
                {%- assign modelname = model.first[0] %}
                {%- assign dimension_data = model.first[1] %}
                {%- include snippets/dimensions.html %}
                {%- unless forloop.last -%}
                <br/><br/>
                {%- endunless -%}
              {% endfor -%}
            {%- else %}
                {%- assign dimension_data = device.dimensions %}
                {%- include snippets/dimensions.html %}
            {%- endif %}
        </td>
    </tr>
    {% endif %}

    {%- if different_battery %}
    <tr>
        <th scope="row">Battery</th>
        <td>
            {%- if device.battery.first.size == 1 -%}
            {%- comment %}The size of "first" will be 1 when there is a list of models{% endcomment -%}
                {% for model in device.battery -%}
                    {%- assign modelname = model.first[0] %}
                    {%- assign battery_data = model.first[1] %}
                    {% include snippets/battery.html %}
                    {%- unless forloop.last -%}
                    <br/><br/>
                    {%- endunless %}
                {% endfor -%}
            {%- else %}
                {%- assign battery_data = device.battery %}
                {% include snippets/battery.html %}
            {%- endif -%}
        </td>
    </tr>
    {%- endif %}

    <tr>
      <td colspan="2">
        <br/>
      </td>
    </tr>
  </tbody>
</table>
<div>
  <i>Some differences may not be shown and instructions may vary</i>
</div>
</div>
{%- endfor %}

</div>