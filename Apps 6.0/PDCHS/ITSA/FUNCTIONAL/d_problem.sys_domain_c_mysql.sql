SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for d_problem.sys_domain_c' ELSE 'SUCCESS' END as Message 
FROM 
(select count(1) as CNT from 
(select sys_id,sourceinstance,sys_domain from pdchs_mdsdb.problem_final where CDCTYPE<>'D') src
left JOIN  pdchs_mdwdb.d_problem trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
where src.sys_domain <> trgt.sys_domain_c ) temp;