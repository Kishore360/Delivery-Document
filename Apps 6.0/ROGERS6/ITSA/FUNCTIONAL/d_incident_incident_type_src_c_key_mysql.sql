SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.incident_final SRC
LEFT JOIN rogers6_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%INCIDENT_TYPE~INCIDENT%' and 
( concat('INCIDENT_TYPE~INCIDENT~',upper(u_incident_type))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN rogers6_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_incident_type IS NULL THEN 0 else -1 end)<> (TRGT.incident_type_src_c_key)
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N';
 
 
 