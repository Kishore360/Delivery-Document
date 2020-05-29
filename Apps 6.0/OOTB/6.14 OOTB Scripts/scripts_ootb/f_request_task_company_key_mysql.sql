
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_request_task.company_key' ELSE 'SUCCESS' END as Message
from (SELECT count(1)  cnt
 FROM #MDS_TABLE_SCHEMA.sc_task_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
 ON ( concat('SUBSIDIARY~',company)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.company IS NULL THEN 0 else -1 end)<> (TRGT.company_key))x