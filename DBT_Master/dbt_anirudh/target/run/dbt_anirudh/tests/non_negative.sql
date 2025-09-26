
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT
    *
FROM
    `dbt_learning`.`bronze`.`bronze_sales`
  
  
      
    ) dbt_internal_test