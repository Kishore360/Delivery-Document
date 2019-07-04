SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.problem_final  SRC 
JOIN meritsa_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
join meritsa_mdwdb.d_lov LKP
on COALESCE(CONCAT('STATE','~','PROBLEM','~',UPPER(SRC.state)),'UNSPECIFIED') = LKP.row_id 
where coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end)<>TRGT.state_src_key