SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_task_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_request_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
JOIN <<tenant>>_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%Y%m%d')  and LKP.source_id=0
)
WHERE case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)
