SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.first_presentation_date_c' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdwdb.d_problem trgt
RIGHT JOIN whirlpool_mdsdb.problem_final src
on src.sys_id = trgt.row_id 
and src.sourceinstance = trgt.source_id
WHERE first_presentation_date_c  <>convert_tz(src.u_first_presentation_date,'GMT','America/New_York')
and src.cdctype='X'
;

