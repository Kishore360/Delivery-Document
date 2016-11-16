SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM wow_mdsdb.u_incident_task_final SRC 
 LEFT JOIN wow_mdwdb.f_incident_task_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN wow_mdwdb.d_lov LKP 
 ON ( COALESCE(CONCAT('IMPACT','~','TASK','~','~','~',UPPER(SRC.impact)),'UNSPECIFIED')= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key)