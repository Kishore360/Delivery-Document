

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message 
 FROM rei_mdsdb.change_task_final SRC
  JOIN rei_mdwdb.f_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN rei_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.work_start,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0)
 WHERE coalesce(LKP.row_key,-99)<>coalesce(TRGT.work_start_on_key,-99)
