
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.incident_key' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_outage TRGT 
 ON SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN <<tenant>>_mdwdb.d_incident LKP 
 ON task_number = LKP.row_id 
 AND SRC.sourceinstance = LKP.source_id 
left join <<tenant>>_mdsdb.task_final TASK
on SRC.sys_id = TASK.sys_id
WHERE COALESCE(LKP.row_key, CASE when SRC.task_number IS NOT NULL and coalesce(upper(TASK.sys_class_name),'') <> 'INCIDENT' then 0 
 WHEN SRC.task_number IS NULL THEN 0
 else '-1' end)<> 
 COALESCE(TRGT.incident_key ,'')