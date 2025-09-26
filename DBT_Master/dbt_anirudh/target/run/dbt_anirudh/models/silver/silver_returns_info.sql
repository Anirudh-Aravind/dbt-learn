
  
    
        create or replace table `dbt_learning_prod`.`silver`.`silver_returns_info`
      
      
  using delta
      
      
      
      
      
      
      
      as
      WITH return_data AS
(
    SELECT
        sales_id,
        product_sk,
        return_reason,
        refund_amount
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_returns`
),
product_data AS
(
    SELECT
        product_sk,
        category,
        department
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_product`
),
customer_data AS
(
    SELECT
        customer_sk,
        gender
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_customer`
),
sales_data AS
(
    SELECT
        sales_id,
        customer_sk
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_sales`
),
joined_query AS
(
    SELECT
        product_data.category,
        product_data.department,
        customer_data.gender,
        return_data.refund_amount
    FROM
        return_data
    INNER JOIN sales_data ON sales_data.sales_id = return_data.sales_id
    INNER JOIN customer_data ON customer_data.customer_sk = sales_data.customer_sk
    INNER JOIN product_data ON product_data.product_sk = return_data.product_sk
)
SELECT
    category,
    department,
    gender,
    sum(refund_amount) as total_refund
FROM
    joined_query
GROUP BY 1,2,3
ORDER BY 1,2 ASC, 4 DESC
  