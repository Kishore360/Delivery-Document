SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdsdb.problem_final  SRC 
JOIN mercuryins_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) 
join mercuryins_mdwdb.d_change_request LKP
on COALESCE(SRC.u_caused_by_change,'UNSPECIFIED')= LKP.row_id 
where coalesce(LKP.row_key,case when SRC.u_caused_by_change is null then 0 else -1 end) <>TRGT.change_request_key