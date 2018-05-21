SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.changed_by' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
 FROM (select * from <<tenant>>_mdsdb.sc_task_final where cdctype<>'D') SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where (src.cdctime<=f1.lastupdated) and COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,''))temp;
 
