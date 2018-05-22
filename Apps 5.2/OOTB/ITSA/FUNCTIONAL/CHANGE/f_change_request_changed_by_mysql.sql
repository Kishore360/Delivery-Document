

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.changed_by' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC 

 inner JOIN <<tenant>>_mdwdb.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,''))temp;
