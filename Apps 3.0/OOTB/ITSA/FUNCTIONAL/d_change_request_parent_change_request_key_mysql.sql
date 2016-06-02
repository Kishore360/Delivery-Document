SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.parent_change_request_key' ELSE 'SUCCESS' END as Message
-- COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) , TRGT.parent_change_request_key
 FROM <<tenant>>_mdsdb.change_request_final SRC
  LEFT JOIN (select row_key,row_id,parent_change_request_key from <<tenant>>_mdwdb.d_change_request) PARENT 
 ON coalesce(SRC.u_parent_change,'UNSPECIFIED')= PARENT.row_id 
 JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE COALESCE(PARENT.row_key,CASE WHEN SRC.parent IS NULL THEN 0 ELSE -1 END ) <> TRGT.parent_change_request_key