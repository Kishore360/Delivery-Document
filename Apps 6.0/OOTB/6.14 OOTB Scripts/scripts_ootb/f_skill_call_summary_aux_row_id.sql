
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.row_id' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_skill_call_summary_aux TRGT 
WHERE concat(dsplit.row_date,'~',dsplit.acd,'~',dsplit.split,'~',synonyms.value) <> COALESCE(TRGT.row_id,'')
AND transformation
