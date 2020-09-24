SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.problem_final SRC
JOIN  fidelity_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
left join fidelity_mdwdb.d_lov LKP
on CONCAT('SECONDARY_ROOT_CAUSE~PROBLEM~',SRC.u_secondary_root_cause)=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_secondary_root_cause is null then 0 else -1 end) <>TRGT.problem_secondary_root_cause_c_key; 







