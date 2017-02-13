

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.time_worked' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
WHERE  TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.time_worked)<>  COALESCE(TRGT.time_worked,'') )b
