{% set int_val = 1 %}
{% set last_val = 3 %}

{% set columns =['sales_id', 'quantity', 'gross_amount'] %}

SELECT 

{% for i in columns %}
    {{ i }}
    {% if not loop.last %} , {% endif %}
{% endfor %}

FROM {{ ref("bronze_sales") }}

{% if int_val == 1 %}
    WHERE date_sk > {{ last_val }}
{% endif %}