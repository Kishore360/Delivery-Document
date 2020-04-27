
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.created_by' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM ge_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sys_created_by ,'')<> COALESCE(TRGT.created_by ,'')
