select 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
FROM (select count(1) as CNT
 FROM tjx_mdsdb.sc_task_final SRC
 LEFT JOIN tjx_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id)
left join tjx_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
 JOIN  tjx_mdwdb.f_request_task a11 on  (a11.request_item_key = TRGT.row_key)
join tjx_mdwdb.d_request_item a19 
on (a11.request_item_key = a19.row_key) 
 WHERE category_name_c in ('ARMS') and  TIMESTAMPDIFF(second, SRC.opened_at, SRC.closed_at)<>  TRGT.open_to_close_duration
AND dimension_wh_code = 'CLOSED')temp;
