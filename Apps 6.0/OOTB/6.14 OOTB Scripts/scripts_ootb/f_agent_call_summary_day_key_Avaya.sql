SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.day_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hagent_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',split,'~',trim(logid),'~',loc_id, '~~', cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date LKP 
	ON LKP.row_id = date_format(SRC.row_date,'%Y%m%d')
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.day_key,'') 