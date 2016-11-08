SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.change_related_other_src_c_key' ELSE 'SUCCESS' END as Message
 FROM homedepot_mdsdb.incident_final SRC 
 LEFT JOIN homedepot_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON (CONCAT('CHANGE_RELATED_OTHER_C~INCIDENT~~~',UPPER(.u_change_related_other))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_change_related_other IS NULL THEN 0 else -1 end)<> (TRGT.change_related_other_src_c_key);