{%- if is_lineage_recovery == true %}
{%- capture content %}
If your recovery does **not** show the LineageOS logo <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 24" style="height: 1rem; vertical-align: middle;">
          <path d="M40,12a4,4,0,0,0-3,1.33l-.23-.09A29.62,29.62,0,0,0,32,11.81h0a8,8,0,0,0-16,0l-.22,0a29.53,29.53,0,0,0-4.6,1.39l-.23.09a4,4,0,1,0,.93,1.78h0a27.62,27.62,0,0,1,4.29-1.29,8,8,0,0,0,15.57,0,27.55,27.55,0,0,1,4.29,1.28h0A4,4,0,1,0,40,12ZM8,18a2,2,0,1,1,2-2A2,2,0,0,1,8,18Zm16,0a6,6,0,1,1,6-6A6,6,0,0,1,24,18Zm16,0a2,2,0,1,1,2-2A2,2,0,0,1,40,18ZM27,12a3,3,0,1,1-3-3A3,3,0,0,1,27,12Z"></path>
        </svg>
   , you accidentally booted into the wrong recovery. Please start at the top of this section!
{%- endcapture %}
    {% include alerts/note.html content=content %}
{%- endif -%}
