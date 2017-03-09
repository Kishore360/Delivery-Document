
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.d_task stg
JOIN nbcu_mdsdb.task_final src ON stg.row_id = src.sys_id AND stg.source_id = src.sourceinstance
join nbcu_mdsdb.incident_final i on src.sys_id=i.sys_id and i.sourceinstance=src.sourceinstance
where CASE WHEN (i.u_major_incident= 1) THEN 'Y' else 'N' END<>stg.major_task_c_flag