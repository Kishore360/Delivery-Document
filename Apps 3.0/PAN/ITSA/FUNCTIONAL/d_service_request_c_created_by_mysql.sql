

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_sr_task_c_created_by' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT  
from 
pan_mdsdb.u_service_request_final SRC 
join pan_mdwdb.d_service_request_c  TRGT  on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
where 
SRC.sys_created_by  <> TRGT.created_by)temp;

