

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_time_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.problem_task_final SRC
 LEFT JOIN molinahealth02_mdwdb.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

LEFT JOIN molinahealth02_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,-99)<>  COALESCE(TRGT.opened_time_key,-99) 