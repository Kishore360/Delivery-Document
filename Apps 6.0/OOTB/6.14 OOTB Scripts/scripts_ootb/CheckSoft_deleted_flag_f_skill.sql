
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.#DWH_TABLE_NAME TRGT
WHERE TRGT.soft_deleted_flag <> 'N'
 