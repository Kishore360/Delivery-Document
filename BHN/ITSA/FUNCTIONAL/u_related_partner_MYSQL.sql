SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM bhn_mdsdb.incident_final SRC
LEFT JOIN bhn_mdwdb.u_ptnr_dax LKP 
 ON 
(u_related_partner)= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_related_partner IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.related_partner_c_key,'')