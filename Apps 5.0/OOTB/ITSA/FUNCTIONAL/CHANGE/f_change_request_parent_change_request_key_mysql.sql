

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.parent_change_request_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM <<tenant>>_mdsdb.change_request_final SRC
  JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN <<tenant>>_mdwdb.d_change_request PARENT 
 ON SRC.parent= PARENT.row_id  AND SRC.sourceinstance= PARENT.source_id
 WHERE COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) <> TRGT.parent_change_request_key)temp;
 