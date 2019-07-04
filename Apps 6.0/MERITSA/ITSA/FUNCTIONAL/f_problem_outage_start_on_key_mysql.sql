SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.problem_final  SRC 
JOIN meritsa_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) 
join meritsa_mdwdb.d_calendar_date LKP
on COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.u_outage_start,'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED') = LKP.row_id 
where coalesce(LKP.row_key,case when SRC.u_outage_start is null then 0 else -1 end)<>TRGT.outage_start_on_key