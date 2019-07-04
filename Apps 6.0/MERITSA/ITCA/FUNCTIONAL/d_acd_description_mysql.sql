
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.description' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.synonyms_final SRC 
LEFT JOIN meritsa_mdwdb.d_acd TRGT 
	ON (SRC.value =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.descr,'')<> COALESCE(TRGT.description,'')
AND SRC.item_type = 'acd'
