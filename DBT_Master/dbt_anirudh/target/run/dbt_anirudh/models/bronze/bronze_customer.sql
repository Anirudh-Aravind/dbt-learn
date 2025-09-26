
  
    
        create or replace table `dbt_learning_prod`.`bronze`.`bronze_customer`
      
      
  using delta
      
      
      
      
      
      
      
      as
      SELECT 
    *
FROM
    `dbt_learning_prod`.`source`.`dim_customer`
  