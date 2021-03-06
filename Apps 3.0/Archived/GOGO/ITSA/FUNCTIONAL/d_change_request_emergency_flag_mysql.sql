 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.emergency_flag' ELSE 'SUCCESS' END as Message
FROM gogo_mdsdb.change_request_final SRC 
 LEFT JOIN gogo_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE CASE WHEN  SRC.u_submission_priority ='emergency' THEN 'Y' ELSE 'N' END <> TRGT.emergency_flag