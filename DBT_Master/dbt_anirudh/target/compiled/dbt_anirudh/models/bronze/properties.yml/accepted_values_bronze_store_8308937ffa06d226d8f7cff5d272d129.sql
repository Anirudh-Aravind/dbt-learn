
    
    

with all_values as (

    select
        store_name as value_field,
        count(*) as n_records

    from `dbt_learning_prod`.`bronze`.`bronze_store`
    group by store_name

)

select *
from all_values
where value_field not in (
    'MegaMar Manhattan','MegaMart Brooklyn','MegaMart Austin','MegaMart San Jose','MegaMart Toronto'
)


