SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.reported_type_src_key' ELSE 'SUCCESS' END as Message
 FROM usf_mdsdb.incident_final SRC 
 LEFT JOIN usf_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN usf_mdwdb.d_lov LKP 
 ON ( concat('CONTACT_TYPE','~','INCIDENT','~','~','~',upper(u_source))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_source IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.reported_type_src_key,'')