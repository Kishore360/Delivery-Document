SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM nbcu_mdsdb.task_final SRC 
  JOIN nbcu_mdwdb.f_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN nbcu_mdwdb.d_lov LKP 
 ON ( concat('STATE~TASK~~~',state)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<>TRGT.state_src_key)temp;


