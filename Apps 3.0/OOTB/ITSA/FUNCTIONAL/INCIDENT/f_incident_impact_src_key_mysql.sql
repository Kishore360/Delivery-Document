

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.impact_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC 
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_lov LKP 
 ON ( concat('IMPACT','~','TASK','~','~','~',upper(impact))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id ) and TRGT.pivot_date between effective_from and effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.impact IS NULL THEN 0 else -1 end)<> (TRGT.impact_src_key))b
