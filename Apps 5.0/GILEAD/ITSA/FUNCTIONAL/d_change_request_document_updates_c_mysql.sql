SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.change_outcome_c_key' ELSE 'SUCCESS' END as Message
 FROM gilead_mdsdb.change_request_final SRC 
 LEFT JOIN gilead_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  u_document_updates<> (TRGT.u_document_updates_c);
 
 
 