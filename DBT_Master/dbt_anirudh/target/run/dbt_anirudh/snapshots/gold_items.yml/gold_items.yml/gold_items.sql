
      
  
    
        create or replace table `dbt_learning_prod`.`gold`.`gold_items`
      
      
  using delta
      
      
      
      
      
      
      
      as
      
    

    select *,
        md5(coalesce(cast(id as string ), '')
         || '|' || coalesce(cast(updateDate as string ), '')
        ) as dbt_scd_id,
        updateDate as dbt_updated_at,
        updateDate as dbt_valid_from,
        
  
  coalesce(nullif(updateDate, updateDate), to_date('9999-12-31'))
  as dbt_valid_to
from (
        select * from `dbt_learning_prod`.`gold`.`gold_items_source`
    ) sbq



  
  