
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.closed_on_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_case_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map L

ON (SRC.state=L.dimension_code
AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~HR_CASE' )
LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
	ON(LKP.row_id = date_format(convert_tz(SRC.closed_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
WHERE (CASE WHEN dimension_wh_code in('CLOSED','RESOLVED','CANCELLED') then 0 else NULL end) and
COALESCE(LKP.row_key,CASE WHEN SRC.closed_at IS NULL THEN '' else '' end)  <> COALESCE(TRGT.closed_on_key,'')
