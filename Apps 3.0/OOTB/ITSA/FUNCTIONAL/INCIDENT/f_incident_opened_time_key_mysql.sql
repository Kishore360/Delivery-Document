

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.opened_time_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.incident_final SRC
  JOIN <<tenant>>_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN <<tenant>>_mdwdb.d_calendar_time LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>),'%H%i')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end)<>  (TRGT.opened_time_key) )b
