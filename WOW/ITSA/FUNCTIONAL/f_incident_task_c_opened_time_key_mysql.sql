 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.u_incident_task_final SRC
 LEFT JOIN wow_mdwdb.f_incident_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN wow_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key   and dlm.dimension_wh_code = 'OPEN'
LEFT JOIN wow_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.opened_at,'UNSPECIFIED'),'GMT','US/Central'),'%H%i') and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'OPEN' then (LKP.row_key) else null end <> (TRGT.OPENED_TIME_KEY); 