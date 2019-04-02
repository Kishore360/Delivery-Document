SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.d_problem trgt
INNER JOIN mercuryins_mdwdb.f_problem src
on trgt.row_key=src.problem_key and src.priority_src_code in (1,2)
where trgt.closed_problem_48hrs_c_flag <> case when (src.opened_to_close_duration_no_weekend_c/(60*60)) <= cast('48' as decimal (10,2)) then 1 else 0 end

