SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM bhn_mdsdb.incident_final SRC
  JOIN bhn_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN bhn_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.sys_created_on,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.sys_created_on is null then 0 else -1 end ) <> (TRGT.opened_on_key) )b
