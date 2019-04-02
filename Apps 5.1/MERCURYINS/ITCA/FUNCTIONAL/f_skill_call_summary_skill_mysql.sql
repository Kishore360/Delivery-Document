SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.skill_key' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.dagent_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split,'~',trim(logid),'~',loc_id) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN mercuryins_mdsdb.us_d_skill_final MDS
	ON ( COALESCE(CONCAT(acd,'~', SRC.split),  'UNSPECIFIED')) = concat(MDS.acd_no,'~',MDS.skill_name) 
LEFT JOIN mercuryins_mdwdb.d_skill LKP 
	ON ( COALESCE(concat(SRC.acd,'~',split), 'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.split IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.skill_key ,'')