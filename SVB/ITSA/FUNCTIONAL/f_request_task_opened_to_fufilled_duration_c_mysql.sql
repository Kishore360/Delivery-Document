
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (	select count(1) as cnt from 
	svb_mdwdb.f_request_task TGT
JOIN svb_mdsdb.sc_task_final SRC
ON TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
where TGT.opened_to_fufilled_duration_c<>case when SRC.opened_at>SRC.due_date then 0 else
coalesce(timestampdiff(second,SRC.opened_at,SRC.due_date),0) end
)abc

