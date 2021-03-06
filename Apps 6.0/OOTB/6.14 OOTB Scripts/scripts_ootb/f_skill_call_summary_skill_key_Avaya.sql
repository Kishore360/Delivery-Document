SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.skill_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hagent_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',starttime,'~',acd,'~',split,'~',trim(logid),'~',loc_id, '~~', cdchash) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_skill_final WHERE CDCTYPE<>'D') MDS
	ON ( COALESCE(CONCAT(acd,'~', SRC.split),  'UNSPECIFIED')) = concat(MDS.acd_no,'~',MDS.skill_name) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill LKP 
	ON ( COALESCE(concat(SRC.acd,'~',split), 'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.split IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.skill_key ,'')