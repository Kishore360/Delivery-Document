SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for #DWH_TABLE_NAME' ELSE 'SUCCESS' END as Message
from mcdonalds_mdsdb.change_task_bwd_delta SRC
left join mcdonalds_mdwdb.d_change_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE SRC.jobid =(select max(jobid) from mcdonalds_mdsdb.change_task_bwd_delta
WHERE sys_id = SRC.sys_id) AND SRC.cdctype <>'I'
AND CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
