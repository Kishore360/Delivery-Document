

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c_created_by' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT  
from 
pan6_mdsdb.u_stask_final SRC 
join pan6_mdwdb.f_sr_task_c  TRGT  on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
where 
SRC.sys_created_by  <> TRGT.created_by)temp;