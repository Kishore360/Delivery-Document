
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME_bwd_delta SRC
LEFT JOIN #DWH_TABLE_SCHEMA.#DWH_TABLE_NAME TRGT 
ON (convert(SRC.sys_id using utf8) =convert(TRGT.timecard_src_id using utf8) 
AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
WHERE CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END
<> COALESCE(CONVERT(TRGT.soft_deleted_flag using utf8),'')
