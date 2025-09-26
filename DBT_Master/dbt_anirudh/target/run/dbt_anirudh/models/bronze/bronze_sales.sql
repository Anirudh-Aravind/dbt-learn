
  
  
  create or replace view `dbt_learning_prod`.`bronze`.`bronze_sales`
  
  as (
    -- block level config


SELECT 
    * 
FROM
    
    `dbt_learning_prod`.`source`.`fact_sales`
  )
