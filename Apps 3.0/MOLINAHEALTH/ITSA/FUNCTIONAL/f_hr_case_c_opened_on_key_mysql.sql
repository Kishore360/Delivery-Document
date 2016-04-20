SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END 
as Message
 FROM molinahealth_mdsdb.u_hr_case_final SRC
 LEFT JOIN molinahealth_mdwdb.f_hr_case_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN molinahealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','America/Los_Angeles'),'%Y%m%d')  )

WHERE coalesce(LKP.row_key,case when SRC.opened_at is null then 0 else -1 end ) <> (TRGT.opened_on_key)

