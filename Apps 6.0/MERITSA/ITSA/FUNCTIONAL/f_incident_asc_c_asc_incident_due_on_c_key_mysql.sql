SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.due_on_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.u_asc_ticket_final SRC
 LEFT JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN meritsa_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE (LKP.row_key) <> (TRGT.asc_incident_due_on_c_key)
