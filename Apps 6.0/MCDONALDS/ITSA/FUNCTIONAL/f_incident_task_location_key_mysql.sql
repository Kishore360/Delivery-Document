select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident_task_c_task.location' ELSE 'SUCCESS' END as Message from (
select count(1) cnt from mcd_mdsdb.incident_task_final SRC
left join mcd_mdwdb.f_incident_task_c TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 left join mcd_mdwdb.d_location d
 on d.row_id = SRC.location
 where coalesce(d.row_key,CASE WHEN SRC.location is NULL then 0 else -1 end)<> TRGT.location_key
 )a