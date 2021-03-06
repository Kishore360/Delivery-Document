/*DELV-1107*/
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.incident_final SRC
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%OUTAGE_CLASS~INCIDENT%' and 
( concat('OUTAGE_CLASS~INCIDENT~~~',u_outage_class )= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
 LEFT JOIN molinahealth_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_class  IS NULL THEN 0 else -1 end)<> (TRGT.outage_class_src_c_key)