 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.grand_parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC
 LEFT JOIN <<tenant>>_mdsdb.change_request_final PARENT 
 ON ( SRC.parent=PARENT.sys_id  
 AND SRC.sourceinstance= PARENT.sourceinstance  )
 left join <<tenant>>_mdwdb.d_change_request D1
 on D1.row_id =  PARENT.parent  AND D1.source_id = PARENT.sourceinstance
 LEFT JOIN <<tenant>>_mdwdb.d_change_request
TRGT 
 ON SRC.sys_id =TRGT.row_id  
 WHERE COALESCE(D1.row_key,CASE WHEN PARENT.parent IS NULL THEN 0 ELSE -1 END )<> TRGT.grand_parent_change_request_key)temp;