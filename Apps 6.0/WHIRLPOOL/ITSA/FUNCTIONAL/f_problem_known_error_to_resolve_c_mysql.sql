SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.problem_final problem 
LEFT JOIN whirlpool_mdwdb.f_problem TRGT 
ON (problem.sys_id =TRGT.row_id  
AND problem.sourceinstance= TRGT.source_id  )
WHERE 
 CASE 
                    WHEN (problem.u_resolved_date  is null 
                    or problem.u_known_error_date is null) THEN NULL    
                    WHEN TIMESTAMPDIFF(SECOND,
                    problem.u_known_error_date,
                    problem.u_resolved_date) < 0 THEN NULL     
                    ELSE TIMESTAMPDIFF(SECOND,
                    problem.u_known_error_date,
                    problem.u_resolved_date) 
                end <> TRGT.known_error_to_resolve_c 
 and problem.CDCTYPE='X' ;   