 select 
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_task.backlog_flag' ELSE 'SUCCESS' END as Message from(
 select ( CASE WHEN LM.dimension_wh_code IN('OPEN') THEN 'Y' ELSE 'N' END)abc, (TRGT.backlog_flag)def
 FROM tjx_mdsdb.sc_task_final SRC 
 LEFT JOIN tjx_mdwdb.d_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN  tjx_mdwdb.f_request_task TRGTF 
 ON (TRGTF.request_task_key =TRGT.row_key
 AND TRGTF.source_id =TRGT.source_id)
LEFT JOIN tjx_mdwdb.d_lov_map LM
 on TRGTF.state_src_key = LM.src_key  AND LM.dimension_class='STATE~SC_TASK' )a
 JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and abc<>def

