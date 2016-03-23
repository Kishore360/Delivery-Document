SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
  FROM nbcu_mdsdb.sc_task_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join nbcu_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
where dimension_wh_code IN ('closed','Resolved') and
CASE WHEN (SRC.opened_at is null  or SRC.closed_at is null) THEN NULL   
 WHEN TIMESTAMPDIFF(SECOND, SRC.opened_at,SRC.closed_at) < 0 THEN NULL     
ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end  <> TRGT.open_to_close_duration