

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.priority_src_key' ELSE 'SUCCESS' END as Message
 FROM jnj_mdsdb.incident_final SRC 
 LEFT JOIN jnj_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN jnj_mdwdb.d_lov LKP 
 ON ( concat('PRIORITY','~','TASK','~','~','~',upper(case when  severity=Sev1 then "Sev1"
when u_reliability=TRUE then "Reliability"
ELSE priority end))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 else -1 end)<> (TRGT.priority_src_key)

