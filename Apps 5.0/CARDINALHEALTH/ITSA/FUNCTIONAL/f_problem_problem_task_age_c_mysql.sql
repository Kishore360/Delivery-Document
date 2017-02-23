SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (
 SELECT count(1) as cnt from cardinalhealth_mdwdb.f_problem f
JOIN (SELECT problem_key,SUM(COALESCE(age_c,0)) as problem_task_age_c
FROM  cardinalhealth_mdwdb.f_problem_task group by problem_key) s ON f.problem_key=s.problem_key
WHERE f.problem_task_age_c <> s.problem_task_age_c ) a