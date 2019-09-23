

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM rogers6_mdsdb.incident_final SRC 
  JOIN rogers6_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN rogers6_mdwdb.d_lov LKP 
 ON  LKP.dimension_class like '%STATE~INCIDENT%' and
( concat('STATE~INCIDENT~',upper(SRC.incident_state))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else -1 end)<> (TRGT.state_src_key)
and SRC.CDCTYPE='X' and LKP.soft_deleted_flag='N')b