
  
    
        create or replace table `dbt_learning_prod`.`bronze`.`bronze_returns`
      
      
  using delta
      
      
      
      
      
      
      
      as
      SELECT
    *
FROM
    `dbt_learning_prod`.`source`.`fact_returns`
  