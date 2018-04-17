

select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.request_key' ELSE 'SUCCESS' END as Message
 FROM (select count(1) as CNT
 FROM tjx_mdsdb.sc_task_final SRC 
 LEFT JOIN tjx_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN tjx_mdwdb.d_request LKP 
 ON ( SRC.request= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
  JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and COALESCE(LKP.row_key,CASE WHEN SRC.request IS NULL THEN 0 else -1 end)<> (TRGT.request_key))temp;
 
