 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN CNT > 0 THEN 'Data validation to MDS f_task_time_worked_c.datetime_ended' ELSE 'Data Matched' END AS Message 
FROM (
Select Count(1) as CNT
from qualcomm_mdsdb.task_time_worked_final SRC 
JOIN qualcomm_mdwdb.f_task_time_worked_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE Convert_tz(SRC.u_date_ended,'GMT','GMT')<>TRGT.datetime_ended
) temp;

