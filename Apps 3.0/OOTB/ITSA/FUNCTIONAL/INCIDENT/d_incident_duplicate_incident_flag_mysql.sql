

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_incident.duplicate_incident_flag' ELSE 'SUCCESS' END as Message from (
 select count(1) cnt FROM <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( 'N','')<> COALESCE(TRGT.duplicate_incident_flag ,'')
)b