
 SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_problem.chronology_of_events_c' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_chronology_of_events from pdchs_mdsdb.problem_final where CDCTYPE<>'D') src
LEFT JOIN  pdchs_mdwdb.d_problem trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where COALESCE(u_chronology_of_events,'UNSPECIFIED')<> trgt.chronology_of_events_c
;
