
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'validation failed for d_change_task.work_end_on' ELSE 'SUCCESS' END as Message
from mcdonalds_mdsdb.change_task_final SRC
LEFT JOIN mcdonalds_mdwdb.d_change_task TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE coalesce(convert_tz(SRC.work_end, 'GMT','America/New_York'),'')
<> COALESCE(TRGT.work_end_on,'')
