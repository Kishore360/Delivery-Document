SELECT case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,

case when count(1) > 0 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' records did not match for #JAGUAR_TABLE_NAME.#COLUMN_NAME ') 
else 'SUCCESS' end as Message
 

t.row_id, #COLUMN_NAME
FROM
 (
   SELECT t1.row_id, t1.#COLUMN_NAME
   FROM #TIGER_DWH_SCHEMA.#TIGER_TABLE_NAME t1
   UNION ALL
   SELECT t2.row_id, t2.#COLUMN_NAME
   FROM #JAGUAR_DWH_SCHEMA.#JAGUAR_TABLE_NAME  t2
)  t
GROUP BY t.row_id, #COLUMN_NAME
HAVING COUNT(1) = 1
ORDER BY t.row_id
