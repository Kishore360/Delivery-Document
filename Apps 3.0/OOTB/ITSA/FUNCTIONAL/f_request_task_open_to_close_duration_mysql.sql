SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.open_to_close_duration' ELSE 'SUCCESS' END as Message
  FROM nbcu_mdsdb.sc_task_final SRC
 LEFT JOIN nbcu_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
<<<<<<< HEAD
 AND SRC.sourceinstance= TRGT.source_id  )

left join <<tenant>>_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key and dimension_wh_code='CLOSED' 
WHERE  TIMESTAMPDIFF(second,SRC.opened_at,coalesce(SRC.closed_at,SRC.sys_updated_on))<>  COALESCE(TRGT.open_to_close_duration,'') and (SRC.opened_at > SRC.closed_at)

=======
 AND SRC.sourceinstance= TRGT.source_id)
left join nbcu_mdwdb.d_lov_map p
on TRGT.state_src_key=p.src_key
where dimension_wh_code IN ('closed','Resolved') and
CASE WHEN (SRC.opened_at is null  or SRC.closed_at is null) THEN NULL   
 WHEN TIMESTAMPDIFF(SECOND, SRC.opened_at,SRC.closed_at) < 0 THEN NULL     
ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end  <> TRGT.open_to_close_duration
>>>>>>> f1fc2cd6f47dd2f514d6f92abcbce7c893ff8b62
