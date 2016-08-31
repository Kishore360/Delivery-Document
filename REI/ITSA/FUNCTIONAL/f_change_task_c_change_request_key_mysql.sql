SELECT COALESCE(LKP.row_key,CASE WHEN SRC.change_request IS NULL THEN 0 else -1 end),TRGT.change_request_key,
SRC.change_request,SRC.change_request, LKP.row_id ,SRC.sys_id ,TRGT.row_id
 FROM rei_mdsdb.change_task_final SRC
 LEFT JOIN rei_mdwdb.f_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 left JOIN rei_mdwdb.d_change_request LKP 
 ON ( SRC.change_request= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.change_request IS NULL and LKP.row_id is not null THEN 0 else -1 end)<> TRGT.change_request_key;