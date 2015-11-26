 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM bhn_mdsdb.incident_final SRC
LEFT JOIN bhn_mdsdb.u_ptnr_dax_final LKP 
 ON 
(SRC.u_related_partner= LKP.sys_id 
AND SRC.sourceinstance= LKP.sourceinstance ) 
 LEFT JOIN bhn_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  LKP.u_name <> related_partner_c