SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.type_src_code' ELSE 'SUCCESS' END as Message
  FROM rei_mdsdb.change_request_final SRC 
 LEFT JOIN rei_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(SRC.u_change_type,'UNSPECIFIED')<> TRGT.type_src_code
