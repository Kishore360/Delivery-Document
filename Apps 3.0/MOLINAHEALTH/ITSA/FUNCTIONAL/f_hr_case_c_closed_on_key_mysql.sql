SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM molinahealth_mdsdb.u_hr_case_final SRC
 LEFT JOIN molinahealth_mdwdb.f_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN molinahealth_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key   
LEFT JOIN molinahealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)


