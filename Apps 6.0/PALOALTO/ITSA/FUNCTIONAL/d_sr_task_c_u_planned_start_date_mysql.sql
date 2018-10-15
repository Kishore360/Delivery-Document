
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'Data Matched' END as Message
FROM 
(SELECT count(1) as CNT
from
pan6_mdsdb.u_stask_final SRC 
join pan6_mdwdb.d_sr_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where TRGT.planned_start_date<> CONVERT_TZ(SRC.u_planned_start_date,'GMT','America/Los_Angeles'))temp;