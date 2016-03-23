SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.urgency_src_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
<<<<<<< HEAD
LEFT JOIN nbcu_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','SC_REQUEST','~','~','~',upper(urgency))= LKP.src_rowid 
=======
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('URGENCY','~','SC_REQ_ITEM','~','~','~',upper(urgency))= LKP.src_rowid 
>>>>>>> 56a8331a7aae4657dd27e0ad126c675b19b8bc73
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.urgency IS NULL THEN 0 else -1 end)<> (TRGT.urgency_src_key)