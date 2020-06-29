SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.rca_inc_open_to_close_duration_c' ELSE 'SUCCESS' END as Message
FROM ibmwatson_mdwdb.f_problem TRGT
inner join ibmwatson_mdsdb.problem_final SRC
on TRGT.row_id= SRC.sys_id and SRC.sourceinstance=TRGT.source_id
where TRGT.rca_inc_open_to_close_duration_c <>  TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) 
and SRC.u_incident is not null;
