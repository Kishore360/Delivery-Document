
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'validation failed for d_incident_task.work_start_on' ELSE 'SUCCESS' END as Message
from tjx_mdsdb.incident_task_final SRC
LEFT JOIN tjx_mdwdb.d_incident_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE coalesce(convert_tz(SRC.work_start, 'GMT','America/New_York'),'')
<> COALESCE(TRGT.work_start_on,'')


