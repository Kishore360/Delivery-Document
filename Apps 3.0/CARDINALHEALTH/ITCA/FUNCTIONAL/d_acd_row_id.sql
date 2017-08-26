
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.row_id' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.synonyms_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_acd TRGT 
	ON (SRC.value =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.value,'')<> COALESCE(TRGT.row_id,'')
AND SRC.item_type = 'acd'
