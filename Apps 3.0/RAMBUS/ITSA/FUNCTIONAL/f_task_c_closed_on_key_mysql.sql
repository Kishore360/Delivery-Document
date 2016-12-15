SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM rambus_mdsdb.task_final SRC
 LEFT JOIN rambus_mdwdb.f_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN rambus_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN rambus_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)


