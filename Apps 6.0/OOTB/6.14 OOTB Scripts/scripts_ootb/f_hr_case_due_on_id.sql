
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.due_on_id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_case_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
	ON (LKP.row_id = date_format(SRC.due_date,'%Y%m%d')  and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.due_date IS NULL THEN 0 else '-1' end) <> COALESCE(TRGT.due_on_id,'')
