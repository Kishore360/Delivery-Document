SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for multiple_assignment_flag' ELSE 'SUCCESS' END as Message 
FROM ntrs_mdsdb.u_problem_task_final SRC
JOIN ntrs_mdwdb.d_problem_task TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.reassignment_count >0 then 'Y' else 'N' end <> TRGT.multiple_assignment_flag;