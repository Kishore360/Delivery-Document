SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.due_on_key' ELSE 'SUCCESS' END as Message
 FROM pan_mdsdb.u_incident_tasks_final SRC
 LEFT JOIN pan_mdwdb.f_incident_tasks_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN pan_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,'GMT','America/Los_Angeles'),'%Y%m%d') 
)
WHERE (LKP.row_key) <>(TRGT.due_on_c_key)


