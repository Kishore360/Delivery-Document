
 SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_problem.recommendations_c' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_recommendations from pdchs_mdsdb.problem_final where CDCTYPE<>'D') src
LEFT JOIN  pdchs_mdwdb.d_problem trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(u_recommendations,'UNSPECIFIED') <> trgt.recommendations_c
;
