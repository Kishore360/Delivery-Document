

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.source_id' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.change_request_final SRC 
 LEFT JOIN molinahealth_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CONVERT_TZ(SRC.u_submitted,'GMT','America/Los_Angeles')<> TRGT.submitted_c 
