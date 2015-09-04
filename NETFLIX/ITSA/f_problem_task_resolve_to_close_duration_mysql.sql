
SELECT CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) =0 THEN 'MDS to DWH data validation failed for f_problem_task.resolve_to_close_duration' ELSE 'SUCCESS' END as Message
