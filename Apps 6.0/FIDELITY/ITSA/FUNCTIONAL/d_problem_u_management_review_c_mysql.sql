SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message 
FROM  fidelity_mdsdb.problem_final SRC
JOIN  fidelity_mdwdb.d_problem TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
WHERE case when u_management_review =1 then 'Y' else 'N' end  <>TRGT.u_management_review_c; 


















