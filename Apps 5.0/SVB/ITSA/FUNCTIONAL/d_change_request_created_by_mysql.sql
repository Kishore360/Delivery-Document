
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_change_request.created_by' ELSE 'SUCCESS' END as Message 
FROM 
(SELECT count(1) as CNT  
from 
svb_mdsdb.change_request_final SRC 
join svb_mdwdb.d_change_request TRGT  
on TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance
where 
SRC.sys_created_by  <> TRGT.created_by)temp;