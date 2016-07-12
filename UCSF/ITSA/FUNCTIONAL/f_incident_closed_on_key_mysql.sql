SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM ucsf_mdsdb.incident_final SRC
 LEFT JOIN ucsf_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 join ucsf_mdwdb.d_lov_map map on map.src_key=TRGT.state_src_key and dimension_wh_code='CLOSED'
LEFT JOIN ucsf_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE LKP.row_key <> TRGT.closed_on_key
