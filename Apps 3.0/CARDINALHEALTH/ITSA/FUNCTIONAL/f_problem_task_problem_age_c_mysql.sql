SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (
SELECT count(1) as cnt from cardinalhealth_mdwdb.f_problem_task f
 JOIN cardinalhealth_mdwdb.f_problem p ON f.problem_key = p.problem_key
WHERE f.problem_age_c <> p.age)a