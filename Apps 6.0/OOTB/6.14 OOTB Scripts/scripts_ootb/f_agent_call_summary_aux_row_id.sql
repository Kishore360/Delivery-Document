
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary_aux.row_id' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_agent_call_summary_aux TRGT 
WHERE concat(dagent.row_date,'~',dagent.acd,'~',dagent.split,'~',dagent.logid,'~',dagent.loc_id,'~',synonym.value) <> COALESCE(TRGT.row_id,'')
AND transformation
