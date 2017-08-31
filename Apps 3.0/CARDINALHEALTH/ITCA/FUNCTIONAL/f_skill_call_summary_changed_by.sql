
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.changed_by' ELSE 'SUCCESS' END as Message
FROM  cardinalhealth_mdwdb.f_skill_call_summary TRGT 
	WHERE COALESCE(TRGT.changed_by,'') <> 'avaya_cms'
