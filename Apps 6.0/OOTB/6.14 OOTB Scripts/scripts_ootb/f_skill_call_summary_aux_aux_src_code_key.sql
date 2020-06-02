
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.aux_src_code_key' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_skill_call_summary_aux TRGT 
LEFT JOIN #DWH_TABLE_SCHEMA. LKP 
	ON ( concat('AUX~CCA~',synonyms.value) = LKP.row_id
	AND TRGT.source_id =LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN concat('AUX~CCA~',synonyms.value) IS NULL THEN 0 else -1 end)<> COALESCE(TRGT.aux_src_code_key,'')
AND transformation
