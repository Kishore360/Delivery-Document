
SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_flag' ELSE 'SUCCESS' END as Message
 FROM(select count(1) as cnt  from  ( select * from bbandt_mdsdb.incident_final where cdctype<>'D') SRC 
  JOIN bbandt_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  ('N')<> COALESCE(TRGT.auto_generated_flag)
)ma
