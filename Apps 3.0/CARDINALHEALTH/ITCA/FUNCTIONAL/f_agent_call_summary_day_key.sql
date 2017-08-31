SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.day_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dagent_final SRC
LEFT JOIN cardinalhealth_mdwdb.f_agent_call_summary TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  app_test.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
	ON LKP.row_id = date_format(SRC.row_date,'%Y%m%d')
WHERE COALESCE(LKP.row_key,'')  <> COALESCE(TRGT.day_key,'') 