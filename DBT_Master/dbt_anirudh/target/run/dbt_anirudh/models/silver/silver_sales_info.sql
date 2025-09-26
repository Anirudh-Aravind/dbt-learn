
  
    
        create or replace table `dbt_learning_prod`.`silver`.`silver_sales_info`
      
      
  using delta
      
      
      
      
      
      
      
      as
      WITH sales AS
(
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        
    quantity * unit_price
 as calculated_gross_amount,
        gross_amount,
        payment_method
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_sales`
),

customer AS
(
    SELECT
        customer_sk,
        concat(first_name, last_name) as c_name,
        gender,
        signup_date
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_customer`
),

product AS
(
    SELECT
        product_sk,
        category
    FROM
        `dbt_learning_prod`.`bronze`.`bronze_product`
),

joined_query AS
(
    SELECT
        sales.sales_id,
        sales.calculated_gross_amount,
        sales.payment_method,
        product.category,
        customer.gender
    FROM
        sales       
    INNER JOIN customer 
        ON customer.customer_sk = sales.customer_sk
    INNER JOIN product
        ON product.product_sk = sales.product_sk
)    

SELECT
    category,
    gender,
    sum(calculated_gross_amount) as total_sales
FROM
    joined_query
GROUP BY 1,2
ORDER BY 1 ASC, 3 DESC
  