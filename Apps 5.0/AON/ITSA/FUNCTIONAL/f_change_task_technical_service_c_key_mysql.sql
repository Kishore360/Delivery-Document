 SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_task.technical_service_c_key' ELSE 'SUCCESS' END as Message  
 FROM (select count(1)cnt from aon_mdsdb.change_task_final SRC
 LEFT JOIN aon_mdwdb.f_major_incident_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN aon_mdwdb.d_service LKP
 ON ( COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.u_technical_service ),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_technical_service  IS NULL THEN 0 else -1 end)<> (TRGT.technical_service_c_key))b;
 
 
 