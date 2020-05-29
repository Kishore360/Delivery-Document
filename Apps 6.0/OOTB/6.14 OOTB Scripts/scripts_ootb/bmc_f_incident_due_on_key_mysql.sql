SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.due_on_key' ELSE 'SUCCESS' END as Message from 
 (select count(1) cnt 
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
JOIN schneider_mdwdb.f_incident TRGT 
ON SRC.incident_number = TRGT.row_id and  SRC.sourceinstance = TRGT.source_id
lEFT JOIN schneider_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.due_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'))
WHERE coalesce(LKP.row_key,case when SRC.required_resolution_datetime is null then 0 else -1 end ) <> (TRGT.due_on_key))b;

