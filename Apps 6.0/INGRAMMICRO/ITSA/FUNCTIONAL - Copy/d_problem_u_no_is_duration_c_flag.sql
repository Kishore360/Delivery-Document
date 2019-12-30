SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.u_no_is_duration_c_flag' ELSE 'SUCCESS' END as Message 
FROM ingrammicro_mdsdb.problem_final SRC
JOIN ingrammicro_mdwdb.d_problem TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
WHERE case when SRC.u_no_is_duration=1 then 'Y' when SRC.u_no_is_duration=0 then 'N' else 'X' end
<>TRGT.u_no_is_duration_c_flag;