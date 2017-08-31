
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov.dimension_code' ELSE 'SUCCESS' END as Message
FROM 
cardinalhealth_mdsdb.synonyms_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_lov TRGT 
	ON (CONCAT('AUX~CCA~~~',SRC.VALUE) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE concat(SRC.value)<> COALESCE(TRGT.dimension_code,'')
AND SRC.item_type = 'aux_rsn'