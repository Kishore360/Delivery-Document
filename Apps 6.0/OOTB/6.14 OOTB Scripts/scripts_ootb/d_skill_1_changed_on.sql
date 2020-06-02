
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.changed_on' ELSE 'SUCCESS' END as Message
FROM #DWH_TABLE_SCHEMA.d_skill TRGT 
WHERE current_date <> COALESCE(TRGT.changed_on,'')
