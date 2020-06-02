SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_hpd_help_desk_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.incident_number=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
on LKP.row_id = COALESCE(DATE_FORMAT(convert_tz(SRC.closed_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d' ),'')
WHERE TRGT.soft_deleted_flag = 'N' and 
COALESCE(LKP.row_key,CASE WHEN SRC.closed_date IS NULL THEN '0' else '-1' end)<> COALESCE(TRGT.closed_on_key,'0')