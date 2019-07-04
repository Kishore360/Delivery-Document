

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.severity_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM meritsa_mdsdb.incident_final SRC 
  JOIN meritsa_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id) and SRC.cdctype<>'D'
LEFT JOIN meritsa_mdwdb.d_lov LKP 
 ON ( concat('SEVERITY','~','INCIDENT','~',upper(severity))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.severity IS NULL THEN 0 else -1 end)<> (TRGT.severity_src_key))b
