
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux.parent_row_key' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_agent_call_summary_aux TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA. LKP 
	ON ( concat(dagent.row_date,'~',dagent.acd,'~',dagent.split,'~',dagent.logid,'~',dagent.loc_id) = LKP.row_id
	AND TRGT.source_id =LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN concat(dagent.row_date,'~',dagent.acd,'~',dagent.split,'~',dagent.logid,'~',dagent.loc_id) IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.parent_row_key,'')
AND transformation
