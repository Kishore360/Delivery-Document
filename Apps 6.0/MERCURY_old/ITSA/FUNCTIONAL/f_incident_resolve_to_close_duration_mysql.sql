SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_problem.result_of_change_c_flag' ELSE 'SUCCESS' END as Message 
FROM mercury_mdwdb.f_incident a join
mercury_mdsdb.incident_final src on a.row_id=src.sys_id and a.source_id=src.sourceinstance
where TIMESTAMPDIFF(SECOND,src.resolved_at,src.closed_at) <>a.resolve_to_close_duration