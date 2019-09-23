SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for f_pm_rca_duration_c.problem_key' ELSE 'SUCCESS' END as Message
-- select distinct coalesce(LKP.row_key,case when SRC.u_problem is null then 0 else -1 end),TRGT.problem_key,SRC.cdctype
 FROM rogers_mdsdb.u_pm_rca_duration_final  SRC  
JOIN rogers_mdwdb.f_pm_rca_duration_c TRGT 
ON SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id
left join rogers_mdwdb.d_problem LKP
on SRC.u_problem=LKP.row_id and SRC.sourceinstance=LKP.source_id 
 WHERE  coalesce(LKP.row_key,case when SRC.u_problem is null then 0 else -1 end)<>TRGT.problem_key
and SRC.CDCTYPE='X';