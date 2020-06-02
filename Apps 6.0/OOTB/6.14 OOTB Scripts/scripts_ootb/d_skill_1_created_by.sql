
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.created_by' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_skill TRGT 
WHERE 'avaya_cms' <> COALESCE(TRGT.created_by,'')
