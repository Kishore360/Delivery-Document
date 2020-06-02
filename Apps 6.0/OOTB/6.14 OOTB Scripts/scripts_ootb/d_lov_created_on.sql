
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov.created_on' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
	ON (CONCAT('AUX~CCA~',SRC.VALUE) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.created_on is null
AND SRC.item_type = 'aux_rsn'
