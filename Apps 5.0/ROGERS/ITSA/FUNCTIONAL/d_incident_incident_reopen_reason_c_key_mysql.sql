SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM rogers_mdsdb.incident_final SRC
LEFT JOIN rogers_mdwdb.d_lov LKP 
 ON LKP.dimension_class like '%U_REOPEN_REASON~INCIDENT%' and 
( concat('U_REOPEN_REASON~INCIDENT~~~',upper(u_reopen_reason))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id ) 
  JOIN rogers_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_reopen_reason IS NULL THEN 0 else -1 end)<> (TRGT.incident_reopen_reason_c_key)
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N';
 
 