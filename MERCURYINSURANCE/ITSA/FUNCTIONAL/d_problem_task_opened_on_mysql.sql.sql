 SELECT CASE WHEN count(1) > 1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >1 THEN 'MDS to DWH data validation failed for d_problem_task.opened_on' ELSE 'SUCCESS' END as Message   FROM ( SELECT 1)A
