SELECT  
-- COALESCE(SRC.value,''), COALESCE(TRGT.acd_code,'')
 CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.acd_code' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.synonyms_final SRC 
LEFT JOIN mercuryins_mdwdb.d_acd TRGT 
	ON (SRC.value =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.value,'')<> COALESCE(TRGT.acd_code,'')
AND SRC.item_type = 'acd';