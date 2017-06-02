SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_bwd_delta SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
ON (convert(concat('APPLICATION~', SRC.sys_id)using utf8) =convert(TRGT.row_id using utf8) 
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE convert(SRC.jobid using utf8)=(select max(jobid) from #MDS_TABLE_SCHEMA.#MDS_TABLE_NAME_bwd_delta 
WHERE sys_id = SRC.sys_id)
AND CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
