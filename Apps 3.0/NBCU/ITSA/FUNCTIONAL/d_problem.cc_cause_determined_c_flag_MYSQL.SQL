
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.cc_cause_determined_c_flag' ELSE 'SUCCESS' END as Message 
(
SELECT Count(1) as CNT  
FROM nbcu_mdsdb.problem_final src
LEFT JOIN nbcu_mdwdb.d_problem trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where IF(src.u_cc_cause_determined='Yes','Y','N')<>trgt.cc_cause_determined_c_flag
) temp;


