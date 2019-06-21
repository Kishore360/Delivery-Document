
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'Data Matched' END as Message
FROM 
(SELECT count(1) as CNT
from
paloalto_mdsdb.u_stask_final SRC 
join paloalto_mdwdb.d_sr_task_c TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where TRGT.planned_end_date<> CONVERT_TZ(SRC.u_planned_end_date,'GMT','America/Los_Angeles'))temp;