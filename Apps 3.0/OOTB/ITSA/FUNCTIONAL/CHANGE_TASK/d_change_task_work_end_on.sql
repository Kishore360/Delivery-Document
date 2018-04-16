
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'validation failed for d_change_task.work_end_on' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.change_task_final SRC
LEFT JOIN <<tenant>>_mdwdb.d_change_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE coalesce(convert_tz(SRC.work_end, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')
<> COALESCE(TRGT.work_end_on,'')
