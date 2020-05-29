
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.group_lvl_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.f_agent_call_summary WHERE CDCTYPE<>'D') TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA. LKP 
 ON (concat(row_date,'~',acd,'~',split,'~',logid,'~',loc_id) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.group_lvl_key <> 0
