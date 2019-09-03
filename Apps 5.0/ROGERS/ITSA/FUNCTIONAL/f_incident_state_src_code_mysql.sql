

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.state_src_code' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM rogers_mdsdb.incident_final SRC 
  JOIN rogers_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.incident_state,'')<> COALESCE(TRGT.state_src_code ,'')
 and SRC.CDCTYPE='X')b
