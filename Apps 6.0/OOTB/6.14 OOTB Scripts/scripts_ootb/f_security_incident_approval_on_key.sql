
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_security_incident.approval_on_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
	ON(LKP.row_id = date_format(SRC.approval_set,'%Y%m%d') and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.approval_set IS NULL THEN '' else '-1' end)  <> COALESCE(TRGT.approval_on_key,'') 
