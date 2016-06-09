

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.failed_change_c_flag' ELSE 'SUCCESS' END as Message
 FROM mercuryins_mdsdb.change_request_final SRC 
 LEFT JOIN mercuryins_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE (CASE WHEN  SRC.u_failed_change=1 THEN 'Y' ELSE 'N' END )<> (TRGT.failed_change_c_flag )

 
