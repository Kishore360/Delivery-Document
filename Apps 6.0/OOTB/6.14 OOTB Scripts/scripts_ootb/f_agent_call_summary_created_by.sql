
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.created_by' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
WHERE 'avaya_cms' <> COALESCE(TRGT.created_by,'')
