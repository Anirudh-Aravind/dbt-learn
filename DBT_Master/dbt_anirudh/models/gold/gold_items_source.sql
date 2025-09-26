WITH deduplication_DATA AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (partition by id ORDER BY updateDate DESC) as deduplication_id
    FROM
        {{ source('input_data', 'items') }}
)
SELECT
    id, name, category, updateDate
FROM deduplication_DATA
WHERE
    deduplication_id = 1