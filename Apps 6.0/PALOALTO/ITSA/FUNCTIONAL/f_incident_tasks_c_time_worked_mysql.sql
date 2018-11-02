

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c_created_by' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT  
from 
paloalto_mdsdb.u_incident_tasks_final SRC 
join paloalto_mdwdb.f_incident_tasks_c  TRGT  on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
where 
SRC.time_worked  <> TRGT.time_worked)temp;



