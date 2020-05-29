select COALESCE(LKP2.row_key,CASE WHEN SRC.loc_id IS NULL THEN 0 else '-1' end), COALESCE(TRGT.location_key,'')
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.dagent_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') LKP
 ON ( SRC.logid= LKP.value  
AND SRC.acd = LKP.acd_no and LKP.item_type = 'agname')
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') LKP1
 ON ( SRC.logid= LKP1.u_agent_log_id )
 left join #DWH_TABLE_SCHEMA.d_location LKP2
 on (LKP2.row_id = LKP1.location)
 WHERE COALESCE(LKP2.row_key,CASE WHEN LKP1.location IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.location_key,'')