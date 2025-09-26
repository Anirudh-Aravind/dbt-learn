
  
  
  create or replace view `dbt_learning_prod`.`bronze`.`bronze_date`
  
  as (
    SELECT  
    *
FROM
    `dbt_learning_prod`.`source`.`dim_date`
  )
