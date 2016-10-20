

SELECT *
FROM nbcu_mdsdb.task_final SRC 
 JOIN nbcu_mdwdb.f_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE COALESCE( SRC.state,'')<> COALESCE(TRGT.state_src_code ,'')
and TRGT.task_type='rm_defect' ;