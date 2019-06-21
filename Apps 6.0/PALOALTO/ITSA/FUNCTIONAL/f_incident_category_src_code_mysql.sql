SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.category_src_code' ELSE 'SUCCESS' END as Message
 FROM pan6_mdsdb.incident_final SRC 
 LEFT JOIN pan6_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.u_category,'')<> COALESCE(TRGT.category_src_code ,'')