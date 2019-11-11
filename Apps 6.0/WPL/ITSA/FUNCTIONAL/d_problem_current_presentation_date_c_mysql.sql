SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.current_presentation_date_c' ELSE 'SUCCESS' END as Message 
FROM wpl_mdwdb.d_problem trgt
RIGHT JOIN wpl_mdsdb.problem_final src
on src.sys_id = trgt.row_id 
and src.sourceinstance = trgt.source_id
WHERE current_presentation_date_c  <>convert_tz(src.u_current_presentation_date,'GMT','America/New_York')
and src.CDCTYPE='X'
;

