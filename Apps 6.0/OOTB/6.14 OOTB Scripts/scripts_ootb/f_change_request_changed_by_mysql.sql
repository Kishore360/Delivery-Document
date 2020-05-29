

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.changed_by' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC 

 inner JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 

 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.sys_updated_by,'')<> COALESCE(TRGT.changed_by ,''))temp;
