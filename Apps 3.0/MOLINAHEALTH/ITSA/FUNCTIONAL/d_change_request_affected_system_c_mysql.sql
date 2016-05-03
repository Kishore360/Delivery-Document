
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.production_change_flag' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC 
 LEFT JOIN molinahealth_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.u_affected_sys<> (TRGT.affected_system_c )
 
 