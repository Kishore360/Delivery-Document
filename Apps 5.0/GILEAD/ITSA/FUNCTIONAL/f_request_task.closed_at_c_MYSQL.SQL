SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_request_task.closed_at_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM gilead_mdsdb.sc_task_final SRC 
LEFT JOIN gilead_mdwdb.f_request_task TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CONVERT_TZ(SRC.closed_at,'GMT', 'America/New_York')<>TRGT.closed_at_c
AND TRGT.soft_deleted_flag='N'
) temp;



