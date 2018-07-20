
 SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_problem.problem_cause_codes_c_key' ELSE 'SUCCESS' END as Message 
FROM (select sys_id,sourceinstance,u_cause_codes from pdchs_mdsdb.problem_final where CDCTYPE<>'D') src
LEFT JOIN  pdchs_mdwdb.d_problem trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pdchs_mdwdb.d_lov lkp
ON COALESCE(CONCAT('CAUSE_CODES_C~PROBLEM~',src.u_cause_codes),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.u_cause_codes IS NULL THEN 0 else -1 end)<> trgt.problem_cause_codes_c_key
;
