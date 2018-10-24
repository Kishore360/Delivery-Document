SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task.type_src_c_key' ELSE 'SUCCESS' END as Message FROM mcdonalds_mdsdb.incident_task_final  SRC 
JOIN mcdonalds_mdwdb.d_incident_task TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) 
 LEFT JOIN mcdonalds_mdwdb.d_lov LKP 
 ON LKP.row_id=(COALESCE(CONCAT('U_TYPE~incident_task','~',SRC.u_type),'UNSPECIFIED') ) 
 and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='U_TYPE~incident_task'
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_type IS NULL THEN 0 else -1 end)<> (TRGT.type_src_c_key) 

 
 