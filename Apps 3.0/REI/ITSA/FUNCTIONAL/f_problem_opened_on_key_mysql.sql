SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM rei_mdsdb.problem_final SRC
 LEFT JOIN rei_mdwdb.f_problem TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 and TRGT.state_src_code is not NULL
LEFT JOIN rei_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,"GMT","America/Los_Angeles"),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key) ;