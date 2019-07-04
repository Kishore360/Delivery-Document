SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident_asc_c.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM meritsa_mdsdb.u_asc_ticket_final SRC
 LEFT JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN meritsa_mdwdb.d_lov_map dlm 
ON TRGT.asc_incident_state_c_key = dlm.src_key  and dlm.dimension_wh_code = 'CLOSED' 
LEFT JOIN meritsa_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.asc_incident_closed_on_key);