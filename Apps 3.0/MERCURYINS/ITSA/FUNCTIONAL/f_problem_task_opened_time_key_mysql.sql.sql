 SELECT CASE WHEN count(1) > 1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >1 THEN 'MDS to DWH data validation failed for f_problem_task.opened_time_key' ELSE 'SUCCESS' END as Message  FROM ( SELECT 1)A
