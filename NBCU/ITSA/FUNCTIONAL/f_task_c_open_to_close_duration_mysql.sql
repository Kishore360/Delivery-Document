


SELECT *
FROM nbcu_mdsdb.task_final SRC 
 JOIN nbcu_mdwdb.f_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id  
AND SRC.sourceinstance= TRGT.source_id  )
WHERE 
	CASE WHEN (SRC.opened_at is null or SRC.closed_at is null) THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) < 0 THEN NULL
	  ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end
<> COALESCE(TRGT.open_to_close_duration ,'')
 ;