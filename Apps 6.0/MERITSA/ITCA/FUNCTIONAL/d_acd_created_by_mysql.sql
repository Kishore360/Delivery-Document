
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.created_by' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.synonyms_final SRC 
LEFT JOIN mercury_mdwdb.d_acd TRGT 
	ON (SRC.value =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE 'avaya_cms'<> COALESCE(TRGT.created_by,'')
AND SRC.item_type = 'acd' and row_key not in (0,-1);