


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
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