SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem_task.opened_time_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.problem_task_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_problem_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )

LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<>  TRGT.opened_time_key)temp;

