SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_enhancement SRC
 LEFT JOIN cardinalhealth_mdwdb.f_enhancement_rm TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = COALESCE(date_format(convert_tz(SRC.closed_at,'GMT','America/New_York'),'%Y%m%d'), 'UNSPECIFIED')  and LKP.source_id=0
) WHERE (LKP.row_key) <> (TRGT.closed_on_key) 