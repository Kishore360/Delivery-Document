SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.problem_final SRC
JOIN  fidelity_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on CONCAT('ACTIVITY_FLAG~PROBLEM~',SRC.u_activity_flag)=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_activity_flag is null then 0 else -1 end) <>TRGT.problem_activity_flag_c_key; 

