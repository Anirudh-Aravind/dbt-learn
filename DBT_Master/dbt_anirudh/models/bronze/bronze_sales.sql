{{
  config(
    materialized = 'view'
    )
}}
-- block level config


SELECT 
    * 
FROM
    {# dbt_learning.source.fact_sales #}
    {{ source('input_data','fact_sales')}}