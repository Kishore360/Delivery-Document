

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message FROM rei_mdsdb.change_task_final SRC
  JOIN rei_mdwdb.f_change_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN rei_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.OPENED_AT,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')) --  LKP.source_id=0 
 WHERE COALESCE(LKP.row_key,case when SRC.OPENED_AT is null then 0 else -1 end)<> TRGT.opened_on_key ;


