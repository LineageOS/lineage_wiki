<br/>
These devices all use the same LineageOS build. The vendor may have released the same device under multiple names,
or the maintainer may support multiple devices using the same code.<br/>
<br/>
Select your variant using the comparison below to make sure your guides are correct.

{%- assign devices = "" | split: " " %}
{%- for dev in site.data.devices %}
  {%- if dev[1].codename == page.device %}
    {%- assign devices = devices | push: dev[1] %}
  {%- endif %}
{%- endfor %}
{%- assign sorted = devices | sort_natural: 'variant' %}

{%- assign different_cam = false %}
{%- assign max_cams = sorted[0].cameras | size %}
{%- assign different_dimensions = false %}
{%- assign different_battery = false %}
{%- assign different_peripherals = false %}
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
    {%- if device.peripherals != sorted[0].peripherals %}
      {%- assign different_peripherals = true %}
    {%- endif %}
  {%- endunless %}
{%- endfor %}

<div class="variants">
  {%- for device in sorted %}
  <div class="variant-item" onClick="location.href='{{ device | device_link | relative_url }}'">
    <div class="variant-title">
      <a href="{{ device | device_link | relative_url }}" class="device_link">{{ device.name }}</a>
    </div>
    <div class="variant-content">
      <table class="deviceinfo table variant_info">
        <tbody>

        {%- if different_cam %}
        <tr class="count-header">
          <th scope="row">Cameras</th>
          <td>{{ device.cameras | size }}</td>
        </tr>
        <tr>
          <td colspan="2" style="padding-top: 0;">
            <ul style="float: right;">
              {%- for el in device.cameras %}
                {%- capture cam_info %}{{ el.info }}, {% if el.flash != 'None' %}{{ el.flash }}{% else %} No{% endif %} flash{% endcapture %}
                <li>{{ cam_info }}</li>
              {%- endfor %}
              {%- assign current_cams = device.cameras | size %}
              {%- assign diff = max_cams | minus: current_cams %}
              {%- if diff > 0 %}
                {%- for i in (1..diff) %}
                <br/>
                {%- endfor %}
              {%- endif %}
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

          {%- if different_peripherals %}
          <tr class="count-header">
            <th scope="row">Peripherals</th>
            <td>{{ device.peripherals | size }}</td>
          </tr>
          <tr>
            <td colspan="2" style="padding-top: 0;">
              {%- assign unique_peripherals = "" | split: " " %}
              {%- for peripheral in device.peripherals %}
                {%- for other_device in devices %}
                  {%- unless other_device.peripherals contains peripheral %}
                    {%- assign unique_peripherals = unique_peripherals | push: peripheral %}
                    {%- break %}
                  {%- endunless %}
                {%- endfor %}
              {%- endfor %}
              {%- assign peripheral_list = unique_peripherals | join: ", " %}
              <p class="peripherals" title="{{ peripheral_list }}">
              {{ peripheral_list }}
              </p>
            </td>
          </tr>
        {% endif %}
        </tbody>
      </table>
      <div class="bottom-label">
        <i>Some differences may not be shown</i>
      </div>
    </div>
  </div>
  {%- endfor %}
</div>
