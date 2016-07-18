SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.outage_type_src_key' ELSE 'SUCCESS' END as Message
 FROM  molinahealth_mdsdb.u_major_incident_final SRC  join molinahealth_mdsdb.incident_final SRC1 on SRC.sys_id=SRC1.sys_id
 LEFT JOIN molinahealth_mdwdb.f_incident TRGT 
 ON (SRC1.sys_id=TRGT.row_id 
 AND SRC1.sourceinstance=TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_lov LKP 
 ON ( concat('OUTAGE_CLASS~INCIDENT~~~',upper(SRC.u_outage_class )) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id ) 
where  COALESCE(LKP.row_key,CASE WHEN SRC.u_outage_class IS NULL THEN 0 else '-1' end)<> (TRGT.outage_class_src_c_key )
