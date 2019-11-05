SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem.CI_total_C' ELSE 'SUCCESS' END as Message 
FROM rogers6_mdwdb.f_problem p 
JOIN (select SUM(f.total_ci_c) as total_ci_c, f.problem_key,f.source_id,soft_deleted_flag from rogers6_mdwdb.f_incident f group by problem_key) i
 ON p.problem_key= i.problem_key and p.source_id=i.source_id
where i.total_ci_c <> p.CI_total_C
 and p.soft_deleted_flag='N' and i.soft_deleted_flag='N';