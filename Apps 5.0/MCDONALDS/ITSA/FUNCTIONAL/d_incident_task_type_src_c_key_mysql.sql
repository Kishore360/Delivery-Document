SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.type_src_c_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdsdb.incident_task_final  SRC 
JOIN mcdonalds_mdwdb.d_incident_task_c TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('TASK_TYPE_C~INCIDENT_TASK','~~~',SRC.u_task_type),'UNSPECIFIED') ) 
 and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='TASK_TYPE_C~INCIDENT_TASK'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_task_type IS NULL THEN 0 else -1 end)<> (TRGT.task_type_src_key) ;