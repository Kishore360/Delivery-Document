SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.problem_final SRC
JOIN  fidelity_mdwdb.f_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_internal_organization LKP
on CONCAT('GROUP~',SRC.u_prb_oversight_group)=LKP.row_id AND SRC.sourceinstance= LKP.source_id
WHERE coalesce(LKP.row_key,case when SRC.u_prb_oversight_group is null then 0 else -1 end) <>TRGT.problem_oversight_group_c_key; 











