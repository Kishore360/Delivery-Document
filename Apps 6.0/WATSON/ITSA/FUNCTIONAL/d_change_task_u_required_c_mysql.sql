
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM  ibmwatson_mdsdb.change_task_final s
 left join  ibmwatson_mdwdb.d_change_task f
 on sys_id=row_id and sourceinstance=source_id
 where coalesce(u_required,'UNSPECIFIED')<>coalesce(u_required_c,'UNSPECIFIED')
 
 
 