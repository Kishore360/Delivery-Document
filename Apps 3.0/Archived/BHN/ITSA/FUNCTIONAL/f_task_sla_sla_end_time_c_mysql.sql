SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM
(select a.sla_end_time_c trgt, CONVERT_TZ(COALESCE(b.end_time,b.planned_end_time),'GMT','America/Los_Angeles') src from 
bhn_mdwdb.f_task_sla a
 JOIN bhn_mdsdb.task_sla_final  b ON a.row_id = b.sys_id
	AND a.source_id = b.sourceinstance)a
where src<>trgt;


