
select * from
(SELECT row_key FROM #DWH_TABLE_SCHEMA.#TABLE_NAME 
WHERE soft_deleted_flag='N'
UNION
SELECT -2) A
ORDER BY row_key

