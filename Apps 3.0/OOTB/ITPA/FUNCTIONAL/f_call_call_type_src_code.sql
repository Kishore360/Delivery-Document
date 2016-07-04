
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_call.call_type_src_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.new_call_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_call TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.call_type ,'')<> COALESCE(TRGT.call_type_src_code ,'')
