
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.created_on' ELSE 'SUCCESS' END as Message
  FROM mercury_mdsdb.synonyms_final SRC 
LEFT JOIN mercury_mdwdb.d_acd TRGT 
	ON (SRC.value =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(TRGT.created_on,'') is null
AND SRC.item_type = 'acd';
