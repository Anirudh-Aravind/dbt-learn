
  
    
        create or replace table `dbt_learning_prod`.`gold`.`gold_items_source`
      
      
  using delta
      
      
      
      
      
      
      
      as
      WITH deduplication_DATA AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (partition by id ORDER BY updateDate DESC) as deduplication_id
    FROM
        `dbt_learning_prod`.`source`.`items`
)
SELECT
    id, name, category, updateDate
FROM deduplication_DATA
WHERE
    deduplication_id = 1
  