SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.day_key' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.dagent_final SRC
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  mercuryins_workdb.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
LEFT JOIN mercuryins_mdwdb.d_calendar_date LKP 
	ON LKP.row_id = date_format(SRC.row_date,'%Y%m%d')
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.day_key,'') 