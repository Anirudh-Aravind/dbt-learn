
  
    
        create or replace table `dbt_learning_prod`.`bronze`.`bronze_product`
      
      
  using delta
      
      
      
      
      
      
      
      as
      SELECT
    *
FROM
    `dbt_learning_prod`.`source`.`dim_product`
  