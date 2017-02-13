SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.change_request_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_change_request TRGT 
  
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE TRGT.reason_for_change_src_code_c <> SRC.u_reason_for_change ;