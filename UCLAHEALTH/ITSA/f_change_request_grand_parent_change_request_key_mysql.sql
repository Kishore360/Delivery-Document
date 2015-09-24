

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.f_change_request
PARENT 
 ON SRC.parent= PARENT.row_id 
 WHERE COALESCE(PARENT.parent_change_request_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END )<> TRGT.grand_parent_change_request_key

 
