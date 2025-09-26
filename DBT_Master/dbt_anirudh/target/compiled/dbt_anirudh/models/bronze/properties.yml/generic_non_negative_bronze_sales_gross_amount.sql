

SELECT 
    *
FROM 
    `dbt_learning_prod`.`bronze`.`bronze_sales`
WHERE
    gross_amount < 0

