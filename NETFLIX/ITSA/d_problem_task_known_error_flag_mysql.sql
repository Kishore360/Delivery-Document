
SELECT CASE WHEN count(1) = 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) =0 THEN 'MDS to DWH data validation failed for d_problem_task.known_error_flag' ELSE 'SUCCESS' END as Message

