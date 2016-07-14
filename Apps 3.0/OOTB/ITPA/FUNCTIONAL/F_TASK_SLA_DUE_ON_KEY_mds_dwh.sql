SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_sla.due_on_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.task_sla_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_task_sla TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)

LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.planned_end_time,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'') <> COALESCE(TRGT.due_on_key,'')
