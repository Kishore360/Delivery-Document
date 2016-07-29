

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.risk_src_code' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
<<<<<<< HEAD
  JOIN <<tenant>>_mdwdb.f_change_request TRGT 
=======
 INNER JOIN <<tenant>>_mdwdb.f_change_request TRGT 
>>>>>>> origin/master
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.risk,'')<> COALESCE(TRGT.risk_src_code ,'')
