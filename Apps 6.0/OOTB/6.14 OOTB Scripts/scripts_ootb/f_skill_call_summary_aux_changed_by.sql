
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary_aux.changed_by' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_skill_call_summary_aux TRGT 
WHERE 'avaya_cms' <> COALESCE(TRGT.changed_by,'')
AND transformation
